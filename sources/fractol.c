#include "mlx.h"
#include "fractol.h"

void fractol_init(t_fractol *fractol)
{
	fractol->mlx = mlx_init();
	fractol->window = mlx_new_window(fractol->mlx, fractol->w, fractol->h, "FRACT-OL?");
}

int main()
{
	t_fractol fractol;

	fractol_init(&fractol);
	mlx_put_image_to_window(fractol.mlx, fractol.window, fractol.img, 0, 0);
}