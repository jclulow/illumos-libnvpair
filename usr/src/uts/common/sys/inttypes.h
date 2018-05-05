#ifndef	_SYS_INTTYPES_H
#define	_SYS_INTTYPES_H

#include <inttypes.h>
#include <stdarg.h>

typedef unsigned int uint_t;

typedef enum {
	B_FALSE = 0,
	B_TRUE = 1
} boolean_t;

typedef long long hrtime_t;

typedef unsigned char uchar_t;

typedef long long longlong_t;
typedef unsigned long long u_longlong_t;
typedef unsigned long ulong_t;

#define	__va_list va_list

#define	TEXT_DOMAIN	""

#endif /* _SYS_INTTYPES_H */
