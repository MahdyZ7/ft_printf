# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ayassin <ayassin@student.42abudhabi.ae>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/12/13 09:20:21 by ayassin           #+#    #+#              #
#    Updated: 2022/01/30 15:47:38 by ayassin          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libftprintf.a

SRC = ft_printfhelper.c ft_printf.c

BNS_SRC = ft_printfhelper1_bonus.c ft_printfhelper2_bonus.c\
		 ft_printfhelper3_bonus.c ft_printf_bonus.c

SUBDIRS = libft

CC = gcc

CFLAGS = -Werror -Wall -Wextra


OBJS = $(SRC:.c=.o)

BNS_OBJS = $(BNS_SRC:.c=.o)


all: $(NAME) bonus

.c.o:
	$(CC) $(CFLAGS) -c $^ -o $@

$(NAME): $(SUBDIRS) $(OBJS)
	cp libft/libft.a $(NAME)
	ar cr $(NAME) $(OBJS)

bonus:$(SUBDIRS) $(BNS_OBJS)
	cp libft/libft.a $(NAME)
	ar cr $(NAME) $(BNS_OBJS)

$(SUBDIRS):
	$(MAKE) all -C $(SUBDIRS)

clean:
	rm -f $(OBJS) $(BNS_OBJS)
	$(MAKE) clean -C $(SUBDIRS)

fclean: clean
	rm -f $(NAME)
	$(MAKE) fclean -C $(SUBDIRS)

re : fclean all

.PHONY: clean fclean libft

