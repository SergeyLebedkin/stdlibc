#ifndef CTYPE_H
#define CTYPE_H

// character classification functions
int isalnum(int c);
int isalpha(int c);
int isblank(int c); // C++11
int iscntrl(int c);
int isdigit(int c);
int isgraph(int c);
int islower(int c);
int isprint(int c);
int ispunct(int c);
int isspace(int c);
int isupper(int c);
int isxdigit(int c);

// character conversion functions
int tolower(int c);
int toupper(int c);

#endif // CTYPE_H