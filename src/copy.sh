#!/bin/bash

scp cat/s21_cat production@192.168.1.11:/usr/local/bin
scp grep/s21_grep production@192.168.1.11:/usr/local/bin

if [ $? -eq 0 ]; then
    echo "Deploy passed!"
else 
    echo "Deploy failed"
    exit 1
fi