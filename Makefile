
TOP =			$(PWD)

CFLAGS =		-Wall -Wextra -Werror \
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

all: $(OBJS:%=obj/%)

obj/%.o: usr/src/common/nvpair/%.c | obj
	$(CC) -c -o $@ $< $(CFLAGS)

obj/%.o: usr/src/lib/libnvpair/%.c | obj
	$(CC) -c -o $@ $< $(CFLAGS)


obj:
	mkdir -p $@

