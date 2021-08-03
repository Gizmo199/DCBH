// Input
var hor = ( keyboard_check(ord("D")) - keyboard_check(ord("A")) );
var ver = ( keyboard_check(ord("S")) - keyboard_check(ord("W")) );
var _sh = mouse_check_button(mb_left);
var pickup = keyboard_check_pressed(ord("F"));

// Move player around
var spd = 4;
var moving = point_distance(0, 0, hor, ver) > 0;
if ( moving )
{
	direction = point_direction(0, 0, hor, ver);	
}
speed = lerp(speed, moving * spd, 0.3);

// Point weapon
weapon_dir = point_direction(x, y, mouse_x, mouse_y);

// If our shoot input is triggered, create our bullet(s)!
if ( weapon )
{
	weapon.parent = id;
	weapon.shoot = _sh;
	weapon.direction = weapon_dir;
}

// Weapon pickup
var weapon_list = ds_list_create();
var weapon_col = collision_circle_list(x, y, sprite_width*0.5, obj_weapon_par, false, true, weapon_list, true);
if ( weapon_col > 0 )
{
	for ( var i=0; i<weapon_col; i++ )
	{
		var w = weapon_list[| i];
		if ( w == weapon ) { continue; }
		if ( pickup )
		{
			// get rid of current weapon
			if ( weapon != -1 )
			{
				weapon.parent = noone;
				weapon.direction = random(360);
				weapon.speed = 5;
				weapon = -1;
			}
			
			// Equip new weapon
			weapon = w;
			w.parent = id;
			w.direction = weapon_dir;
			w.image_angle = weapon_dir;
			
			break;
		}
	}
}
ds_list_destroy(weapon_list);
