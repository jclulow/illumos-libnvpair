
TOP =			$(PWD)

LIBRARY =		libnvpair.a

CFLAGS =		-Wall -Wextra -Werror \
			-Wno-unused-parameter \
			-Wno-format-security \
			-Wno-sign-compare \
			-Wno-unknown-pragmas \
			-Wno-uninitialized \
			-std=c99 -D__EXTENSIONS__ \
			-pthread \
			-I$(TOP)/usr/src/uts/common \
			-I$(TOP)/usr/src/lib/libnvpair

OBJS =			libnvpair.o \
			nvpair_alloc_system.o \
			nvpair_alloc_fixed.o \
			nvpair.o \
			fnvpair.o \
			nvpair_json.o

CC =			gcc
AR =			ar

all: obj/$(LIBRARY)

test: obj/test
	@echo running test program...
	@./obj/test
	@echo ... test ok

obj/test: test.c obj/$(LIBRARY)
	$(CC) -o $@ $(CFLAGS) $^

obj/%.o: usr/src/common/nvpair/%.c | obj
	$(CC) -c -o $@ $< $(CFLAGS)

obj/%.o: usr/src/lib/libnvpair/%.c | obj
	$(CC) -c -o $@ $< $(CFLAGS)

obj/$(LIBRARY): $(OBJS:%=obj/%)
	$(AR) rcs $@ $^

obj:
	mkdir -p $@

clean:
	rm -f obj/$(LIBRARY)
	rm -f $(OBJS:%=obj/%)
	rm -f obj/test

clobber:
	rm -rf obj/

