#include "s21_cat.h"

int main(int argc, char *argv[]) {
  flags flag = {0};
  int StrCount = 1;
  int EmptyStrCount = 0;
  if (!ParserOfFlags(argc, argv, &flag)) {
    int FirstFile = optind;
    while (optind < argc) {
      reader(argv, &flag, &StrCount, &EmptyStrCount, FirstFile);
      optind++;
    }
  }
  return 0;
}

int ParserOfFlags(int argc, char *argv[], flags *flag) {
  int err = 0;
  int CurrentOption;
  static struct option LongOptions[] = {
      {"number-nonblank", 0, 0, 'b'},
      {"number", 0, 0, 'n'},
      {"squeeze-blank", 0, 0, 's'},
      {0, 0, 0, 0},
  };
  while ((CurrentOption =
              getopt_long(argc, argv, "+bEnsTvet", LongOptions, NULL)) != -1) {
    switch (CurrentOption) {
      case 'b':
        flag->b = 1;
        break;
      case 'E':
        flag->e = 1;
        break;
      case 'n':
        flag->n = 1;
        break;
      case 's':
        flag->s = 1;
        break;
      case 'T':
        flag->t = 1;
        break;
      case 'v':
        flag->v = 1;
        break;
      case 'e':
        flag->e = 1;
        flag->v = 1;
        break;
      case 't':
        flag->t = 1;
        flag->v = 1;
        break;
      default:
        err = 1;
        break;
    }
    if (flag->b == 1 && flag->n == 1) {
      flag->n = 0;
    }
  }
  return err;
}

void reader(char *argv[], flags *flag, int *StrCount, int *EmptyStrCount,
            int FirstFile) {
  FILE *file = fopen(argv[optind], "rb");
  if (file != NULL) {
    int CurrentChar;
    int PreviousChar;
    if (optind == FirstFile)
      PreviousChar = '\n';
    else
      PreviousChar = '\0';
    while ((CurrentChar = getc(file)) != EOF) {
      if (flag->s && CurrentChar == '\n' && PreviousChar == '\n') {
        (*EmptyStrCount)++;
        if (*EmptyStrCount > 1) {
          continue;
        }
      } else {
        *EmptyStrCount = 0;
      }
      if ((PreviousChar == '\n') &&
          ((flag->b && CurrentChar != '\n') || flag->n))
        printf("%6d\t", (*StrCount)++);
      if (flag->t && CurrentChar == '\t') {
        printf("^");
        CurrentChar = 'I';
      }
      if (flag->e && CurrentChar == '\n') printf("$");
      if (flag->v) {
        if ((CurrentChar >= 0 && CurrentChar < 9) ||
            (CurrentChar > 10 && CurrentChar < 32) ||
            (CurrentChar > 126 && CurrentChar <= 160)) {
          printf("^");
          if (CurrentChar > 126) {
            CurrentChar -= 64;
          } else {
            CurrentChar += 64;
          }
        }
        if (CurrentChar > 160 && CurrentChar < 256) {
          printf("M-");
          CurrentChar -= 128;
        }
      }
      printf("%c", CurrentChar);
      PreviousChar = CurrentChar;
    }
  } else {
    printf("s21_cat: %s: No such file or directory\n", argv[optind]);
  }
}
