function gun_init()
{
	parent = noone;
	
	bullet = -1;
	bullet_speed = 0;
	trigger_speed = 0.2;
	recoil = 10;
	recoil_step = 0;
	shoot = false;
	
	image_index = 0;
	image_speed = 0;
}
function gun_update()
{
	// Position ourselves if we are being handled
	if ( parent != noone )
	{
		var ldx = lengthdir_x(recoil_step, direction+180);
		var ldy = lengthdir_y(recoil_step, direction+180);
		var ldx2 = lengthdir_x(parent.sprite_width*0.75, direction);
		var ldy2 = lengthdir_y(parent.sprite_width*0.75, direction);
		
		x = parent.x + ldx + ldx2;
		y = parent.y + ldy + ldy2;
		
		visible = false;
	}
	else
	{
		shoot = false;
		recoil_step = 0;
		visible = true;
	}
	
	// Shooting
	if ( shoot && recoil_step < 1 )
	{
		var ldx = lengthdir_x(sprite_width*.5, direction);
		var ldy = lengthdir_y(sprite_width*.5, direction);
		
		bul_type_create(bullet, xprevious + ldx, yprevious + ldy, direction, bullet_speed);
		recoil_step = recoil;
	}
	
	recoil_step = lerp(recoil_step, 0, trigger_speed);
	
	// Sprite handling
	image_angle = direction;
	image_yscale = 1;
	if ( image_angle > 90 && image_angle < 270 )
	{
		image_yscale = -1;
	}
	
	// Slow our speed
	speed = lerp(speed, 0, 0.15);

}	

function gun_set(spr, img, bul, bulspd, trigspd, rcl)
{
	///@func gun_set(sprite, image_index, bullet_id, bullet_speed, trigger_speed, recoil)
	sprite_index = spr;
	image_index = img;
	bullet = bul;
	bullet_speed = bulspd;
	trigger_speed = trigspd;
	recoil = rcl;
}