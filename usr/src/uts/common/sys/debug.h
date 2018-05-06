#ifndef	_SYS_DEBUG_H
#define	_SYS_DEBUG_H

#include <stdlib.h>

#define	ASSERT(cond)

#define	VERIFY(EX)	do { if (!(EX)) { abort(); } } while (0)

#define	VERIFY0(cond)	VERIFY((cond) == 0)
#define	VERIFY3U(a, op, b)	VERIFY((a) op (b))
#define	VERIFY3S(a, op, b)	VERIFY((a) op (b))

#endif /* _SYS_DEBUG_H */
