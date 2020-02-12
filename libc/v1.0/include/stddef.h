#ifndef STDDEF_H
#define STDDEF_H

// Result of pointer subtraction (type)
typedef int ptrdiff_t;
// Unsigned integral type (type)
typedef unsigned long long size_t;
// Type with widest scalar alignment (type)
typedef double max_align_t;
// Null pointer type (C++) (type)
#define nullptr_t decltype(nullptr);
// Return member offset (macro)
#define offsetof(s,m) ((::size_t)&reinterpret_cast<char const volatile&>((((s*)0)->m)))
// Null pointer (macro )
#define NULL ((void *)0)

#endif // STDDEF_H