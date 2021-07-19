function bul_type() constructor
{
	sprite_index = -1;
	image_index = 0;
	image_speed = 0;
	image_angle = 0;
	image_xscale = 1;
	image_yscale = 1;
	image_blend = c_white;
	image_alpha = 1;
	
	scale_speed_x = 0;
	scale_speed_y = 0;
	
	friction = 0;
	
	radial = false;
	radial_number = 0;
	radial_cutoff = 360;
	
	life = -1;
	damage = 0;
	
	static bul_type_set_attributes = function(o)
	{
		o.sprite_index			= sprite_index;
		o.image_index			= image_index;
		o.image_speed			= image_speed;
		o.image_angle			= image_angle;
		o.image_xscale			= image_xscale;
		o.image_yscale			= image_yscale;
		o.image_alpha			= image_alpha;
		o.image_blend			= image_blend;
		o.friction				= friction;
		
		o.life					= life;
		o.damage				= damage;
		o.scale_speed_x			= scale_speed_x;
		o.scale_speed_y			= scale_speed_y;
	}
}

function bul_type_set_life(ind, l)
{
	///@func bul_type_set_life(bullet_id, life_amount)
	ind.life = l;
}
function bul_type_set_sprite(ind, spr, idx, spd)
{
	///@func bul_type_set_sprite(bullet_id, sprite_index, image_index, image_speed)
	ind.sprite_index = spr;
	ind.image_index = idx;
	ind.image_speed = spd;
}
function bul_type_set_scale(ind, xs, ys, xsi, ysi)
{
	///@func bul_type_set_scale(bullet_id, xscale, yscale, xscale_incr, yscale_incr)
	ind.image_xscale = xs;
	ind.image_yscale = ys;
	ind.scale_speed_x = xsi;
	ind.scale_speed_y = ysi;
}
function bul_type_set_alpha(ind, alpha)
{
	///@func bul_type_set_alpha(bullet_id, alpha)
	ind.image_alpha = alpha;	
}
function bul_type_set_color(ind, color)
{
	///@func bul_type_set_color(bullet_id, color)
	ind.image_blend = color;	
}
function bul_type_set_radial(ind, num, co, tf)
{
	///@func bul_type_set_radial(bullet_id, instance_number, cutoff_angle, enabled)
	ind.radial = tf;
	ind.radial_number = num;
	ind.radial_cutoff = co;
}
function bul_type_set_damage(ind, dam)
{
	///@func bul_type_set_damage(bullet_id, damage_amount)
	ind.damage = dam;
}
function bul_type_set_friction(ind, fric)
{
	///@func bul_type_set_friction(bullet_id, friction)
	ind.friction = fric;
}

function bul_type_create(ind, _x, _y, dir, spd)
{
	///@func bul_type_create(bullet_id, x, y, direction, speed)
	var ret = noone;
	var bullet_object = obj_bullet;
	
	// Create radial bullets
	if ( ind.radial )
	{
		var adiv = ind.radial_cutoff / ( ind.radial_number-1 );
		var sdir = dir + ( ind.radial_cutoff * 0.5 );
		for ( var i=0; i<ind.radial_number; i++ )
		{
			var d = sdir - ( i * adiv );
			var xx = _x + lengthdir_x(sprite_get_width(ind.sprite_index) * 0.5 * ind.image_xscale, d );
			var yy = _y + lengthdir_y(sprite_get_width(ind.sprite_index) * 0.5 * ind.image_xscale, d );
			var bul = instance_create_layer( xx, yy, layer, bullet_object );
			
			bul.direction = d;
			bul.image_angle = d;
			bul.speed = spd;
			
			ind.bul_type_set_attributes(bul);
			ret[i] = bul;
		}
	}
	else
	
	// Create regular bullets
	{
		var xx = _x + lengthdir_x(sprite_get_width(ind.sprite_index) * 0.5 * ind.image_xscale, dir );
		var yy = _y + lengthdir_y(sprite_get_width(ind.sprite_index) * 0.5 * ind.image_xscale, dir );
		var bul = instance_create_layer( xx, yy, layer, bullet_object );
		
		bul.direction = dir;
		bul.image_angle = dir;
		bul.speed = spd;
			
		ind.bul_type_set_attributes(bul);
		ret[0] = bul;
	}
	
	return ret;
}