// Input
var shoot = mouse_check_button_pressed(mb_left);

// Direction to shoot
direction = point_direction(x, y, mouse_x, mouse_y);

// If our shoot input is triggered, create our bullet(s)!
if ( shoot )
{
	bul_type_create(bullet, x, y, direction, bullet_speed);
}