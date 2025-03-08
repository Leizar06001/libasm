#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <errno.h>

extern size_t ft_strlen(const char *s);
extern char *ft_strcpy(char *dest, const char *src);
extern int ft_strcmp(const char *s1, const char *s2);
extern ssize_t ft_write(int fd, const void *buf, size_t count);
extern ssize_t ft_read(int fd, void *buf, size_t count);
extern char *ft_strdup(const char *s);

int main() {
    // Test ft_strlen
    char *str = "Hello, World!";
    printf("ft_strlen(Hello, World!) > 13: %zu\n", ft_strlen(str));

    // Test ft_strcpy
    char dest[20];
    ft_strcpy(dest, str);
    printf("\nft_strcpy: %s\n", dest);

    // Test ft_strcmp
    printf("\nft_strcmp (abc vs abd): %d\n", ft_strcmp("abc", "abd"));
    printf("ft_strcmp (abc vs abc): %d\n", ft_strcmp("abc", "abc"));
    printf("ft_strcmp (abd vs abc): %d\n", ft_strcmp("abd", "abc"));

    // Test ft_write
    ft_write(1, "ft_write: Success!\n", 19);

    // Test ft_write error (invalid fd)
    errno = 0;
    ft_write(42, "test", 4);
    printf("\nft_write error: errno=%d\n", errno);

    // Test ft_read
    int fd = open("test.txt", O_RDONLY);
    char buffer[100];
    ssize_t bytes = ft_read(fd, buffer, 99);
    if (bytes == -1)
        perror("\nft_read");
    else {
        buffer[bytes] = '\0';
        printf("\nft_read: %s\n", buffer);
    }
    close(fd);

    // Test ft_strdup
    char *dup = ft_strdup(str);
    printf("\nft_strdup: %s\n", dup);
    free(dup);

    return 0;
}