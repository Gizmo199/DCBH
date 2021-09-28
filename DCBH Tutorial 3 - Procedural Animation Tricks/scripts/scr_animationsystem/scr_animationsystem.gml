function animation() constructor
{
	sprite_index = -1;
	image_index = 0;
	image_xscale = 1;
	image_yscale = 1;
	image_angle = 0;
	image_blend = c_white;
	image_alpha = 1;
	
	gravity = 0.4;
	x = 0;
	y = 0;
	z = 0;
	
	zspeed = 0;
	rotate = 1;
	
	parent = noone;
	
	function bind(onoff)
	{
		if ( onoff )
		{
			parent = other;	
		}
		else
		{
			parent = noone;	
		}
	}
	
	function update(moving)
	{
		if ( parent )
		{
			x = parent.x;
			y = parent.y;
			
			if ( z < 0 )
			{
				zspeed += gravity;	
			}
			else
			{
				if ( moving )
				{
					zspeed = -4;
					rotate *= -1;
					image_xscale = 0.5;
					image_yscale = 1.5;
				}
				else
				{
					if ( zspeed != 0 )
					{
						zspeed = 0;
						image_xscale = 1.5;
						image_yscale = 0.5;
					}
				}
			}
			
			z += zspeed;
			
			if ( parent.weapon )
			{
				parent.weapon.y += z;	
			}
			
			image_index = round(parent.weapon_dir/45) % 8;
		}
			
		image_angle = lerp(image_angle, zspeed * rotate * 3, 0.2);
		image_xscale = lerp(image_xscale, 1, 0.2);
		image_yscale = lerp(image_yscale, 1, 0.2);			
	}
	
	function draw()
	{
		if ( !sprite_index ) exit;
		
		var sh = sprite_get_height(sprite_index) * 0.5;
		draw_sprite_ext(
			sprite_index,
			image_index,
			x,
			y + z + sh,
			image_xscale,
			image_yscale,
			image_angle,
			image_blend,
			image_alpha
		);	
	}
}