var shoot = mouse_check_button_pressed(mb_left);
direction = point_direction(x, y, mouse_x, mouse_y);

if ( shoot )
{
	bul_type_create(bullet, x, y, direction, bullet_speed);
}