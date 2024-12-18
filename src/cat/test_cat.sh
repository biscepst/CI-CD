#!/bin/bash

COUNTER_SUCCESS=0
COUNTER_FAIL=0
DIFF_RES=""
TEST_FILE="test1.txt"
RED="$(tput setaf 1)"
GREEN="$(tput setaf 2)"
BASE="$(tput setaf 7)"
echo "" > log.txt

for var in -b -e -n -s -t -v -E -T --number-nonblank --number --squeeze-blank
do
          TEST1="$var $TEST_FILE"
          ./s21_cat $TEST1 > s21_cat.txt
          cat $TEST1 > cat.txt
          DIFF_RES="$(diff -s s21_cat.txt cat.txt)"
          if [ "$DIFF_RES" == "Files s21_cat.txt and cat.txt are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
            else
              echo "$TEST1" >> log.txt
              (( COUNTER_FAIL++ ))
          fi
          echo "[${GREEN}${COUNTER_SUCCESS}${BASE}/${RED}${COUNTER_FAIL}${BASE}] ${GREEN}${RESULT}${BASE} $TEST1" 
          rm s21_cat.txt cat.txt
done

for var in -b -e -n -s -t -v -E -T --number-nonblank --number --squeeze-blank
do
  for var2 in -b -e -n -s -t -v -E -T --number-nonblank --number --squeeze-blank
  do
        if [ $var != $var2 ]
        then
          TEST2="$var $var2 $TEST_FILE"
          ./s21_cat $TEST2 > s21_cat.txt
          cat $TEST2 > cat.txt
          DIFF_RES="$(diff -s s21_cat.txt cat.txt)"
          if [ "$DIFF_RES" == "Files s21_cat.txt and cat.txt are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
            else
              echo "$TEST2" >> log.txt
              (( COUNTER_FAIL++ ))
          fi
          echo "[${GREEN}${COUNTER_SUCCESS}${BASE}/${RED}${COUNTER_FAIL}${BASE}] ${GREEN}${RESULT}${BASE} $TEST2" 
          rm s21_cat.txt cat.txt
        fi
  done
done

echo "${GREEN}SUCCESS_TESTS:${BASE} $COUNTER_SUCCESS"
echo "${RED}FAIL_TESTS${BASE}: $COUNTER_FAIL"