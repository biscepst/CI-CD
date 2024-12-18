#!/bin/bash

COUNTER_SUCCESS=0
COUNTER_FAIL=0
DIFF_RES=""
RED="$(tput setaf 1)"
GREEN="$(tput setaf 2)"
BASE="$(tput setaf 7)"

./s21_grep rr test1.txt > s21_grep.txt
grep rr test1.txt > grep.txt
DIFF_RES="$(diff -s s21_grep.txt grep.txt)"
if [ "$DIFF_RES" == "Files s21_grep.txt and grep.txt are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
            else
              (( COUNTER_FAIL++ ))
          fi
rm s21_grep.txt grep.txt

./s21_grep -e rr test1.txt > s21_grep.txt
grep -e rr test1.txt > grep.txt
DIFF_RES="$(diff -s s21_grep.txt grep.txt)"
if [ "$DIFF_RES" == "Files s21_grep.txt and grep.txt are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
            else
              (( COUNTER_FAIL++ ))
          fi
rm s21_grep.txt grep.txt

./s21_grep -i rr test1.txt > s21_grep.txt
grep -i rr test1.txt > grep.txt
DIFF_RES="$(diff -s s21_grep.txt grep.txt)"
if [ "$DIFF_RES" == "Files s21_grep.txt and grep.txt are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
            else
              (( COUNTER_FAIL++ ))
          fi
rm s21_grep.txt grep.txt

./s21_grep -v rr test1.txt > s21_grep.txt
grep -v rr test1.txt > grep.txt
DIFF_RES="$(diff -s s21_grep.txt grep.txt)"
if [ "$DIFF_RES" == "Files s21_grep.txt and grep.txt are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
            else
              (( COUNTER_FAIL++ ))
          fi
rm s21_grep.txt grep.txt

./s21_grep -c rr test1.txt > s21_grep.txt
grep -c rr test1.txt > grep.txt
DIFF_RES="$(diff -s s21_grep.txt grep.txt)"
if [ "$DIFF_RES" == "Files s21_grep.txt and grep.txt are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
            else
              (( COUNTER_FAIL++ ))
          fi
rm s21_grep.txt grep.txt

./s21_grep -l rr test1.txt > s21_grep.txt
grep -l rr test1.txt > grep.txt
DIFF_RES="$(diff -s s21_grep.txt grep.txt)"
if [ "$DIFF_RES" == "Files s21_grep.txt and grep.txt are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
            else
              (( COUNTER_FAIL++ ))
          fi
rm s21_grep.txt grep.txt

./s21_grep -n rr test1.txt > s21_grep.txt
grep -n rr test1.txt > grep.txt
DIFF_RES="$(diff -s s21_grep.txt grep.txt)"
if [ "$DIFF_RES" == "Files s21_grep.txt and grep.txt are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
            else
              (( COUNTER_FAIL++ ))
          fi
rm s21_grep.txt grep.txt

./s21_grep -h rr test1.txt > s21_grep.txt
grep -h rr test1.txt > grep.txt
DIFF_RES="$(diff -s s21_grep.txt grep.txt)"
if [ "$DIFF_RES" == "Files s21_grep.txt and grep.txt are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
            else
              (( COUNTER_FAIL++ ))
          fi
rm s21_grep.txt grep.txt

./s21_grep -s rr test1.txt > s21_grep.txt
grep -s rr test1.txt > grep.txt
DIFF_RES="$(diff -s s21_grep.txt grep.txt)"
if [ "$DIFF_RES" == "Files s21_grep.txt and grep.txt are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
            else
              (( COUNTER_FAIL++ ))
          fi
rm s21_grep.txt grep.txt

./s21_grep -f test_pattern.txt test1.txt > s21_grep.txt
grep -f test_pattern.txt test1.txt > grep.txt
DIFF_RES="$(diff -s s21_grep.txt grep.txt)"
if [ "$DIFF_RES" == "Files s21_grep.txt and grep.txt are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
            else
              (( COUNTER_FAIL++ ))
          fi
rm s21_grep.txt grep.txt

./s21_grep -o rr test1.txt > s21_grep.txt
grep -o rr test1.txt > grep.txt
DIFF_RES="$(diff -s s21_grep.txt grep.txt)"
if [ "$DIFF_RES" == "Files s21_grep.txt and grep.txt are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
            else
              (( COUNTER_FAIL++ ))
          fi
rm s21_grep.txt grep.txt

./s21_grep -iv rr test1.txt > s21_grep.txt
grep -iv rr test1.txt > grep.txt
DIFF_RES="$(diff -s s21_grep.txt grep.txt)"
if [ "$DIFF_RES" == "Files s21_grep.txt and grep.txt are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
            else
              (( COUNTER_FAIL++ ))
          fi
rm s21_grep.txt grep.txt

./s21_grep -ic rr test1.txt > s21_grep.txt
grep -ic rr test1.txt > grep.txt
DIFF_RES="$(diff -s s21_grep.txt grep.txt)"
if [ "$DIFF_RES" == "Files s21_grep.txt and grep.txt are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
            else
              (( COUNTER_FAIL++ ))
          fi
rm s21_grep.txt grep.txt

./s21_grep -il rr test1.txt > s21_grep.txt
grep -il rr test1.txt > grep.txt
DIFF_RES="$(diff -s s21_grep.txt grep.txt)"
if [ "$DIFF_RES" == "Files s21_grep.txt and grep.txt are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
            else
              (( COUNTER_FAIL++ ))
          fi
rm s21_grep.txt grep.txt

./s21_grep -in rr test1.txt > s21_grep.txt
grep -in rr test1.txt > grep.txt
DIFF_RES="$(diff -s s21_grep.txt grep.txt)"
if [ "$DIFF_RES" == "Files s21_grep.txt and grep.txt are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
            else
              (( COUNTER_FAIL++ ))
          fi
rm s21_grep.txt grep.txt

./s21_grep -ih rr test1.txt > s21_grep.txt
grep -ih rr test1.txt > grep.txt
DIFF_RES="$(diff -s s21_grep.txt grep.txt)"
if [ "$DIFF_RES" == "Files s21_grep.txt and grep.txt are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
            else
              (( COUNTER_FAIL++ ))
          fi
rm s21_grep.txt grep.txt

./s21_grep -io rr test1.txt > s21_grep.txt
grep -io rr test1.txt > grep.txt
DIFF_RES="$(diff -s s21_grep.txt grep.txt)"
if [ "$DIFF_RES" == "Files s21_grep.txt and grep.txt are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
            else
              (( COUNTER_FAIL++ ))
          fi
rm s21_grep.txt grep.txt

./s21_grep -vi rr test1.txt > s21_grep.txt
grep -vi rr test1.txt > grep.txt
DIFF_RES="$(diff -s s21_grep.txt grep.txt)"
if [ "$DIFF_RES" == "Files s21_grep.txt and grep.txt are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
            else
              (( COUNTER_FAIL++ ))
          fi
rm s21_grep.txt grep.txt

./s21_grep -vc rr test1.txt > s21_grep.txt
grep -vc rr test1.txt > grep.txt
DIFF_RES="$(diff -s s21_grep.txt grep.txt)"
if [ "$DIFF_RES" == "Files s21_grep.txt and grep.txt are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
            else
              (( COUNTER_FAIL++ ))
          fi
rm s21_grep.txt grep.txt

./s21_grep -vl rr test1.txt > s21_grep.txt
grep -vl rr test1.txt > grep.txt
DIFF_RES="$(diff -s s21_grep.txt grep.txt)"
if [ "$DIFF_RES" == "Files s21_grep.txt and grep.txt are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
            else
              (( COUNTER_FAIL++ ))
          fi
rm s21_grep.txt grep.txt

./s21_grep -vn rr test1.txt > s21_grep.txt
grep -vn rr test1.txt > grep.txt
DIFF_RES="$(diff -s s21_grep.txt grep.txt)"
if [ "$DIFF_RES" == "Files s21_grep.txt and grep.txt are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
            else
              (( COUNTER_FAIL++ ))
          fi
rm s21_grep.txt grep.txt

./s21_grep -vh rr test1.txt > s21_grep.txt
grep -vh rr test1.txt > grep.txt
DIFF_RES="$(diff -s s21_grep.txt grep.txt)"
if [ "$DIFF_RES" == "Files s21_grep.txt and grep.txt are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
            else
              (( COUNTER_FAIL++ ))
          fi
rm s21_grep.txt grep.txt

./s21_grep -vs rr test1.txt > s21_grep.txt
grep -vs rr test1.txt > grep.txt
DIFF_RES="$(diff -s s21_grep.txt grep.txt)"
if [ "$DIFF_RES" == "Files s21_grep.txt and grep.txt are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
            else
              (( COUNTER_FAIL++ ))
          fi
rm s21_grep.txt grep.txt

./s21_grep -ci rr test1.txt > s21_grep.txt
grep -ci rr test1.txt > grep.txt
DIFF_RES="$(diff -s s21_grep.txt grep.txt)"
if [ "$DIFF_RES" == "Files s21_grep.txt and grep.txt are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
            else
              (( COUNTER_FAIL++ ))
          fi
rm s21_grep.txt grep.txt

./s21_grep -cv rr test1.txt > s21_grep.txt
grep -cv rr test1.txt > grep.txt
DIFF_RES="$(diff -s s21_grep.txt grep.txt)"
if [ "$DIFF_RES" == "Files s21_grep.txt and grep.txt are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
            else
              (( COUNTER_FAIL++ ))
          fi
rm s21_grep.txt grep.txt

./s21_grep for s21_grep.c s21_grep.h Makefile -v -n -o > s21_grep.txt
grep for s21_grep.c s21_grep.h Makefile -v -n -o > grep.txt
DIFF_RES="$(diff -s s21_grep.txt grep.txt)"
if [ "$DIFF_RES" == "Files s21_grep.txt and grep.txt are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
            else
              (( COUNTER_FAIL++ ))
          fi
rm s21_grep.txt grep.txt

./s21_grep -e while -e void s21_grep.c Makefile -v -n -o -f test_pattern.txt > s21_grep.txt
grep -e while -e void s21_grep.c Makefile -v -n -o -f test_pattern.txt > grep.txt
DIFF_RES="$(diff -s s21_grep.txt grep.txt)"
if [ "$DIFF_RES" == "Files s21_grep.txt and grep.txt are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
            else
              (( COUNTER_FAIL++ ))
          fi
rm s21_grep.txt grep.txt

echo "${GREEN}SUCCESS_TESTS:${BASE} $COUNTER_SUCCESS"
echo "${RED}FAIL_TESTS${BASE}: $COUNTER_FAIL"