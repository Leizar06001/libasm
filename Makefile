NAME = libasm.a
SRC_DIR = src
SRC = $(addprefix $(SRC_DIR)/, ft_strlen.s ft_strcpy.s ft_strcmp.s ft_write.s ft_read.s ft_strdup.s)
OBJ = $(SRC:.s=.o)

all: $(NAME)

$(NAME): $(OBJ)
	ar rcs $@ $^

%.o: %.s
	nasm -f elf64 -dPIC $< -o $@

clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(NAME) test

re: fclean all

test: $(NAME)
	gcc -fPIE main.c -L. -lasm -o test

.PHONY: all clean fclean re test