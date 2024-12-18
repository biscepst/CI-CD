#ifndef S21_GREP_H_
#define S21_GREP_H_

#include <getopt.h>
#include <regex.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define BUFFER 10000

typedef struct {
  int e;
  int i;
  int v;
  int c;
  int l;
  int n;
  int h;
  int s;
  int f;
  int o;
  int FileCounter;
  char StrOfTemplate[BUFFER];
  char StrForO[BUFFER];
  char StrOfFile[BUFFER];
  char Filename[BUFFER];
} flags;

int ParserOfFlags(int argc, char *argv[], flags *flag);
void reader(char *argv[], flags *flag);
void FFlag(flags *flag);
void OFlags(flags *flag, int match, regex_t reg, regmatch_t start);

#endif