NAME			=	fractol
SRCS_DIR 		=	./sources/
OBJS_DIR		=	./objectfs/
MINILIBX_DIR	=	./minilibx/
HDRS_DIR		=	./headers/
SRCS			=	
SRCS_AGG 		=	$(addprefix $(SRCS_DIR), $(SRCS))
OBJS			=	$(SRCS_AGG:.c=.o)
SRCS_ALL_D		=	$(SRCS_AGG:.c=.d)
CC				=	gcc
CFLAGS			=	-Wall -Wextra -Werror -I $(HDRS_DIR) 
RM				=	rm -f

# COLORS
RED 	= 	\033[0;31m
GREEN 	= 	\033[0;32m
BLUE	=	\033[0;34m
CYAN	=	\033[0;36m
RESET 	= 	\033[0m

$(NAME):	$(OBJS) Makefile
			@echo "[$(NAME)] $(CYAN) Making up $(MINILIBX_DIR) $(RESET)"
			@make -sC $(MINILIBX_DIR) all
			@echo "[$(NAME)] $(CYAN) Making up $(NAME) $(RESET)"
			$(CC) $(SRCS_AGG) -o $(NAME)
			@echo "$(CYAN) -> All done <- $(RESET)"

all:	$(NAME)

$(OBJS_DIR)/%.o: $(SRCS_DIR)/%.c
		$(CC) $(CFLAGS) -c $< -o $@ -MD

debug:		$(OBJS) Makefile
			@echo "[DEBUG] $(BLUE) Making up $(MINILIBX_DIR) $(RESET)"
			@make -sC $(MINILIBX_DIR) all
			@echo "[DEBUG] $(BLUE) Making up $(NAME) $(RESET)"
			$(CC) $(OBJS) -o $(NAME)
			@echo "$(CYAN) -> All done <- $(RESET)"
			
clean:
			@echo "[clean] $(RED) Cleaning up $(MINILIBX_DIR) $(RESET)"
			@make -sC $(MINILIBX_DIR) clean
			@echo "[clean] $(RED) Cleaning up $(NAME) $(RESET)"
			$(RM) $(OBJS) $(SRCS_ALL_D)

fclean:	clean
			$(RM) $(NAME)

re:		fclean all

.PHONY:	all bonus clean fclean re 