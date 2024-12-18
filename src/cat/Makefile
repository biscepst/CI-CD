CC=gcc
FLAGS= -Wall -Werror -Wextra -std=c11

all: s21_cat

s21_cat: 
	$(CC) $(FLAGS) s21_cat.c -o s21_cat

rebuild: clean all

test:
	bash test_cat.sh

style:
	clang-format --style=Google -n *.c *.h
	cppcheck --enable=all --suppress=missingIncludeSystem s21_cat.c

clean:
	rm -rf s21_cat log.txt

