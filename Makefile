# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jfortin <jfortin@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/07/30 17:14:16 by jfortin           #+#    #+#              #
#    Updated: 2019/05/01 15:44:53 by jfortin          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CFLAGS = -Wall -Wextra -Werror -MMD

ifeq ($(DEBUG),yes)
	CFLAGS += -g -DDEBUG #-fsanitize=address
else
	CFLAGS += -O3
endif

NAME = git-train

SRC_NAME =	main.c \

SRC_DIR = src
INC_DIR = inc
BUILD_DIR = obj

OBJ = $(addprefix $(BUILD_DIR)/,$(SRC_NAME:.c=.o))
DPD = $(addprefix $(BUILD_DIR)/,$(SRC_NAME:.c=.d))

opti:
		@$(MAKE) -j16 all

debug:
		@$(MAKE) opti DEBUG=yes

all:
	@$(MAKE) $(NAME)
	@$(MAKE) art

$(NAME): $(OBJ)
		@echo "\033[2K \033[A"
		@gcc $(CFLAGS) -o $(NAME) $(OBJ)
		@echo "$(NAME) created"
		@echo $(NAME) > .gitignore

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c
		@mkdir -p $(BUILD_DIR)
		@echo "\033[2K [$(NAME)]: Compilation of $< \033[A"
		@gcc $(CFLAGS) -I $(INC_DIR) -c $< -o $@

clean:
		@rm -rf $(BUILD_DIR)
		@echo "[$(NAME)]: OBJ deleted"

fclean: clean
		@rm -f $(NAME)
		@echo "[$(NAME)]: deleted"

re : fclean opti

############################## DECORATION ######################################

art:
	@echo "                 _-====-__-======-__-========-_____-============-__"
	@echo "               _(                                                 _)"
	@echo "            OO(             G I T       T R A I N                 )_"
	@echo "           0  (_                                                   _)"
	@echo "         o0     (_                                                _)"
	@echo "        o         '=-___-===-_____-========-___________-===-dwb-='"
	@echo "      .o                                _________"
	@echo "     . ______          ______________  |         |      _____"
	@echo "   _()_||__|| ________ |            |  |_________|   __||___||__"
	@echo "  (BNSF 1995| |      | |            | __Y______00_| |_         _|"
	@echo " /-OO----OO\"\"=\"OO--OO\"=\"OO--------OO\"=\"OO-------OO\"=\"OO-------OO\"=P"

.PHONY: all, clean, fclean, re

-include $(DPD)