
#include <err.h>
#include <string.h>

#include <libnvpair.h>


int
main(int argc, char *argv[])
{
	int e;
	nvlist_t *nvl;

	if ((e = nvlist_alloc(&nvl, NV_UNIQUE_NAME, 0) != 0)) {
		errx(1, "nvlist_alloc: %s", strerror(e));
	}

	if (nvlist_add_string(nvl, "first", "value!") != 0 ||
	    nvlist_add_string(nvl, "second", "value!") != 0) {
		errx(1, "nvlist_add_string");
	}

	fprintf(stdout, "list:\n");
	dump_nvlist(nvl, 4);

	nvlist_free(nvl);
}
