#ifndef S21_CAT_H_
#define S21_CAT_H_

#include <getopt.h>
#include <stdio.h>

typedef struct {
  int b;
  int e;
  int n;
  int s;
  int t;
  int v;
} flags;

int ParserOfFlags(int argc, char *argv[], flags *flag);
void reader(char *argv[], flags *flag, int *StrCount, int *EmptyStrCount,
            int FirstFile);

#endif