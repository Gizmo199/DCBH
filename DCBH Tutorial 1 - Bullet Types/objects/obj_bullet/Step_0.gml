// Make our image angle follow the direction we are moving
image_angle = direction;

// Increment/decrement our scales by our scale speeds
image_xscale += scale_speed_x;
image_yscale += scale_speed_y;

// Decrement our life, if it is equal to 0, destroy us
life--;
if ( floor(life) == 0 )
{
	instance_destroy();	
}