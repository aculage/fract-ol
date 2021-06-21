#ifndef FRACTOL_H
# define FRACTOL_H

# include <inttypes.h>

typedef struct s_fractol
{
	void	*mlx;
	void	*window;
	int32_t	w;
	int32_t	h;
	void	*img;
}				t_fractol;
