#ifndef STRING_H
#define STRING_H

// NULL
#define NULL ((void *)0)

// size_t
typedef long long size_t

// locate character in block of memory
const void *memchr(const void *ptr, int value, size_t num);
// locate character in block of memory
void *memchr(void *ptr, int value, size_t num);
// compare two blocks of memory
int memcmp(const void *ptr1, const void *ptr2, size_t num);
// copy block of memory
void *memcpy(void *destination, const void *source, size_t num);
// move block of memory
void *memmove(void *destination, const void *source, size_t num);
// fill block of memory
void *memset(void *ptr, int value, size_t num);
// concatenate strings
char *strcat(char *destination, const char *source);
// locate first occurrence of character in string
const char *strchr(const char *str, int character);
// locate first occurrence of character in string
char *strchr(char *str, int character);
// compare two strings
int strcmp(const char *str1, const char *str2);
// compare two strings using locale
int strcoll(const char *str1, const char *str2);
// copy string
char *strcpy(char *destination, const char *source);
// get span until character in string
size_t strcspn(const char *str1, const char *str2);
// get pointer to error message string
char *strerror(int errnum);
// get string length
size_t strlen(const char *str);
// append characters from string
char *strncat(char *destination, const char *source, size_t num);
// compare characters of two strings
int strncmp(const char *str1, const char *str2, size_t num);
// copy characters from string
char *strncpy(char *destination, const char *source, size_t num);
// locate characters in string
const char *strpbrk(const char *str1, const char *str2);
// locate characters in string
char *strpbrk(char *str1, const char *str2);
// locate last occurrence of character in string
const char *strrchr(const char *str, int character);
// locate last occurrence of character in string
char *strrchr(char *str, int character);
// get span of character set in string
size_t strspn(const char *str1, const char *str2);
// locate substring
const char *strstr(const char *str1, const char *str2);
// locate substring
char *strstr(char *str1, const char *str2);
// split string into tokens
char *strtok(char *str, const char *delimiters);
// split string into tokens
size_t strxfrm(char *destination, const char *source, size_t num);

#endif // STRING_H