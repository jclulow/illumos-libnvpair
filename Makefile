
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

OBJDIR =		obj

CC =			gcc
AR =			ar

all: $(OBJDIR)/$(LIBRARY)

test: $(OBJDIR)/test
	@echo running test program...
	@$(OBJDIR)/test
	@echo ... test ok

$(OBJDIR)/test: test.c $(OBJDIR)/$(LIBRARY)
	$(CC) -o $@ $(CFLAGS) $^

$(OBJDIR)/%.o: usr/src/common/nvpair/%.c | $(OBJDIR)
	$(CC) -c -o $@ $< $(CFLAGS)

$(OBJDIR)/%.o: usr/src/lib/libnvpair/%.c | $(OBJDIR)
	$(CC) -c -o $@ $< $(CFLAGS)

$(OBJDIR)/$(LIBRARY): $(OBJS:%=$(OBJDIR)/%)
	$(AR) rcs $@ $^

$(OBJDIR):
	mkdir -p $@

clean:
	rm -f $(OBJDIR)/$(LIBRARY)
	rm -f $(OBJS:%=$(OBJDIR)/%)
	rm -f $(OBJDIR)/test

clobber:
	rm -rf $(OBJDIR)/

