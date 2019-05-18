#include <string.h>
#include <stdint.h>

// locate character in block of memory
void *memchr(void *ptr, int value, size_t num)
{
    // find character
    unsigned char cvalue = (unsigned char)value;
    unsigned char *cptr = (unsigned char *)ptr;
    for (size_t i = 0; i < num; i++, cptr++)
        if ((*cptr) == cvalue)
            return cptr;
    // return NULL
    return NULL;
}

// compare two blocks of memory
int memcmp(const void *ptr1, const void *ptr2, size_t num)
{
    return 0;
}

// copy block of memory
void *memcpy(void *dst, const void *src, size_t num)
{
    // copy by 4/8 bytes
    unsigned long *wdst = (unsigned long *)dst;
    unsigned long *wsrc = (unsigned long *)src;
    for (size_t i = 0, m = num / sizeof(long); i < m; i++)
        *(wdst++) = *(wsrc++);
    // copy by 1 byte
    unsigned char *cdst = (unsigned char *)wdst;
    unsigned char *csrc = (unsigned char *)wsrc;
    for (size_t i = 0, m = num % sizeof(long); i < m; i++)
        *(cdst++) = *(csrc++);
    // return dst
    return dst;
}

// move block of memory
void *memmove(void *dst, const void *src, size_t num)
{
    // copy buffer
    if ((uintptr_t)dst < (uintptr_t)src)
        return memcpy(dst, src, num);
    // copy by 1 byte
    unsigned char *cdst = (unsigned char *)dst + num;
    unsigned char *csrc = (unsigned char *)src + num;
    for (size_t i = 0; i < num; i++)
        *(cdst--) = *(csrc--);
    // return dst
    return dst;
}

// fill block of memory
void *memset(void *ptr, int value, size_t num)
{
    // copy by 1 byte
    unsigned char cvalue = (unsigned char)value;
    unsigned char *cptr = (unsigned char *)ptr;
    for (size_t i = 0; i < num; i++)
        *(cptr++) = cvalue;
    // return dst
    return ptr;
}

// concatenate strings
char *strcat(char *dst, const char *src)
{
    return NULL;
}

// locate first occurrence of character in string
char *strchr(char *str, int character)
{
    return NULL;
}

// compare two strings
int strcmp(const char *str1, const char *str2)
{
    return 0;
}

// compare two strings using locale
int strcoll(const char *str1, const char *str2)
{
    return 0;
}

// copy string
char *strcpy(char *dst, const char *src)
{
    return NULL;
}

// get span until character in string
size_t strcspn(const char *str1, const char *str2)
{
    return 0;
}

// get pointer to error message string
char *strerror(int errnum)
{
    return NULL;
}

// get string length
size_t strlen(const char *str)
{
    size_t len = 0;
    while (*(str++))
        len++;
    return len;
}

// append characters from string
char *strncat(char *dst, const char *src, size_t num)
{
    return NULL;
}

// compare characters of two strings
int strncmp(const char *str1, const char *str2, size_t num)
{
    return 0;
}

// copy characters from string
char *strncpy(char *dst, const char *src, size_t num)
{
    return NULL;
}

// locate characters in string
char *strpbrk(char *str1, const char *str2)
{
    return NULL;
}

// locate last occurrence of character in string
char *strrchr(char *str, int character)
{
    return NULL;
}

// get span of character set in string
size_t strspn(const char *str1, const char *str2)
{
    return 0;
}

// locate substring
char *strstr(char *str1, const char *str2)
{
    return NULL;
}

// split string into tokens
char *strtok(char *str, const char *delimiters)
{
    return NULL;
}

// split string into tokens
size_t strxfrm(char *dst, const char *src, size_t num)
{
    return 0;
}