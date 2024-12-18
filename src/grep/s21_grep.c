#include "s21_grep.h"

int main(int argc, char *argv[]) {
  flags flag = {0};
  if (!ParserOfFlags(argc, argv, &flag)) {
    while (optind < argc) {
      reader(argv, &flag);
      optind++;
    }
  }
  return 0;
}

int ParserOfFlags(int argc, char *argv[], flags *flag) {
  int CurrentOption;
  int err = 0;
  while ((CurrentOption = getopt(argc, argv, "e:ivclnhsf:o")) != -1) {
    switch (CurrentOption) {
      case 'e':
        flag->e = 1;
        strcat(flag->StrOfTemplate, optarg);
        strcat(flag->StrOfTemplate, "|");
        break;
      case 'i':
        flag->i = 1;
        break;
      case 'v':
        flag->v = 1;
        break;
      case 'c':
        flag->c = 1;
        break;
      case 'l':
        flag->l = 1;
        break;
      case 'n':
        flag->n = 1;
        break;
      case 'h':
        flag->h = 1;
        break;
      case 's':
        flag->s = 1;
        break;
      case 'o':
        flag->o = 1;
        break;
      case 'f':
        flag->f = 1;
        strcpy(flag->Filename, optarg);
        FFlag(flag);
        break;
      default:
        err = 1;
        break;
    }
  }
  if (flag->c && flag->l) {
    flag->c = 0;
  }
  if (!flag->e && !flag->f) {
    if (argc > optind) {
      strcat(flag->StrOfTemplate, argv[optind]);
    }
    optind++;
  }
  if (flag->e || flag->f) {
    flag->StrOfTemplate[strlen(flag->StrOfTemplate) - 1] = '\0';
  }
  if (argc - optind > 1) flag->FileCounter = 1;
  return err;
}

void reader(char *argv[], flags *flag) {
  FILE *file = fopen(argv[optind], "r");
  regex_t reg;
  regmatch_t start;
  int FlagI = REG_EXTENDED;
  if (flag->i) {
    FlagI = REG_EXTENDED | REG_ICASE;
  }
  regcomp(&reg, flag->StrOfTemplate, FlagI);
  if (file != NULL) {
    int CounterOfMatch = 0;
    int CounterStr = 0;
    while (fgets(flag->StrOfFile, BUFFER, file) != NULL) {
      int match = regexec(&reg, flag->StrOfFile, 1, &start, 0);
      CounterStr++;
      if (!match) CounterOfMatch++;
      if (flag->v) match = !match;
      if (flag->o && flag->v) continue;
      if (!match && !flag->l && !flag->c && !flag->n && !flag->o) {
        printf("%s", flag->StrOfFile);
        if (flag->StrOfFile[strlen(flag->StrOfFile) - 1] != '\n') printf("\n");
      }
      if (((!match && !flag->v) || (flag->v && match)) && flag->FileCounter &&
          !flag->l && !flag->h && !flag->c)
        printf("%s:", argv[optind]);
      if (!match && flag->n && !flag->c && !flag->l) {
        if (flag->o) {
          printf("%d:", CounterStr);
        } else
          printf("%d:%s", CounterStr, flag->StrOfFile);
        if (flag->StrOfFile[strlen(flag->StrOfFile) - 1] != '\n') printf("\n");
      }
      OFlags(flag, match, reg, start);
    }
    if (flag->l && CounterOfMatch < 1 && flag->v && !flag->c) {
      printf("%s\n", argv[optind]);
    }
    if (flag->l && CounterOfMatch > 0 && !flag->c) printf("%s\n", argv[optind]);
    if (flag->c && !flag->l) {
      if (flag->FileCounter && !flag->h) printf("%s:", argv[optind]);
      if (!flag->v) printf("%d\n", CounterOfMatch);
      if (flag->v) printf("%d\n", CounterStr - CounterOfMatch);
    }
    if (flag->c && flag->l) printf("%s\n", argv[optind]);
    fclose(file);
  } else {
    if (!flag->s)
      printf("s21_grep: %s: No such file or directory\n", argv[optind]);
  }
  regfree(&reg);
}

void FFlag(flags *flag) {
  FILE *file;
  file = fopen(flag->Filename, "rb");
  if (file != NULL) {
    while (fgets(flag->StrOfFile, BUFFER, file) != NULL) {
      if (flag->StrOfFile[strlen(flag->StrOfFile) - 1] == '\n' &&
          strlen(flag->StrOfFile) - 1 != 0)
        flag->StrOfFile[strlen(flag->StrOfFile) - 1] = '\0';
      strcat(flag->StrOfTemplate, flag->StrOfFile);
      strcat(flag->StrOfTemplate, "|");
    }
    fclose(file);
  }
}

void OFlags(flags *flag, int match, regex_t reg, regmatch_t start) {
  if (flag->o) strcpy(flag->StrForO, flag->StrOfFile);
  if (!match && flag->o && !flag->l && !flag->c) {
    char *p = flag->StrForO;
    while ((regexec(&reg, p, 1, &start, 0) == 0)) {
      printf("%.*s\n", (int)(start.rm_eo - start.rm_so), p + start.rm_so);
      p += start.rm_eo;
    }
  }
}
