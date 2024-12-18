CC=gcc
FLAGS= -Wall -Werror -Wextra -std=c11 

all: s21_grep

s21_grep: 
	$(CC) $(FLAGS) s21_grep.c -o s21_grep

rebuild: clean all

test:
	bash test_grep.sh

style:
	clang-format --style=Google -n *.c *.h
	cppcheck --enable=all --suppress=missingIncludeSystem s21_grep.c

clean:
	rm -rf s21_grep
