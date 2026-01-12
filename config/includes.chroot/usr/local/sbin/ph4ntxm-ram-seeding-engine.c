#define _GNU_SOURCE
#include <sys/mman.h>
#include <sys/sysinfo.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#define MB(x) ((size_t)(x) * 1024 * 1024)

static size_t pagesize;

static size_t target_bytes(void)
{
    struct sysinfo i;
    sysinfo(&i);

    size_t total =
        (i.totalram * i.mem_unit) / (1024 * 1024);

    size_t base = total * 1 / 100;

    return MB(base);
}

static void seed(unsigned char *p, size_t len)
{
    const char *f[] = {
        "ELF\x02\x01\x01",
        "ssh-ed25519",
        "ecdsa-sha2-nistp256",
        "TLS_AES_256_GCM_SHA384",
        "TLS_CHACHA20_POLY1305_SHA256",
        "Mozilla/5.0",
        "application/json",
        "/lib/x86_64-linux-gnu/libc.so.6",
        "-----BEGIN PRIVATE KEY-----"
    };

    size_t fn = sizeof(f) / sizeof(f[0]);

    for (size_t o = 0; o < len; o += pagesize) {
        unsigned char *q = p + o;
        q[0] = (unsigned char)(o ^ (getpid() << 3));
        if ((o / pagesize) % 23 == 0)
            memcpy(q, f[(o / pagesize) % fn], 8);
    }
}

int main(void)
{
    pagesize = sysconf(_SC_PAGESIZE);

    size_t len = target_bytes();

    unsigned char *p = mmap(
        NULL,
        len,
        PROT_READ | PROT_WRITE,
        MAP_PRIVATE | MAP_ANONYMOUS,
        -1,
        0
    );

    if (p == MAP_FAILED)
        return 1;

    madvise(p, len, MADV_WILLNEED);
    madvise(p, len, MADV_RANDOM);

    seed(p, len);

    if (mlock(p, len) != 0) {
        for (size_t o = 0; o < len; o += MB(1))
            mlock(p + o, MB(1));
    }

    for (;;) {
        for (size_t o = 0; o < len; o += pagesize * 64)
            p[o] ^= (unsigned char)getpid();
        sleep(300);
    }
}
