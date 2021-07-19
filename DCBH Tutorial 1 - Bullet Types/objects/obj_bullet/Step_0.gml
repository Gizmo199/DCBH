image_angle = direction;
image_xscale += scale_speed_x;
image_yscale += scale_speed_y;

life--;
if ( floor(life) == 0 )
{
	instance_destroy();	
}