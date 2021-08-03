global.__bullettype = [];
global.__bullettypemax = 3;

for ( var i = 0; i<global.__bullettypemax; i++ )
{
	global.__bullettype[i] = new bul_type();	
}

#macro bullet_pistol global.__bullettype[0]
#macro bullet_shotgun global.__bullettype[1]
#macro bullet_laser global.__bullettype[2]

// Pistol bullet
bul_type_set_life(bullet_pistol, -1);
bul_type_set_sprite(bullet_pistol, spr_bullet, 0, 0);

// Shotgun bullet
bul_type_set_life(bullet_shotgun, 30);
bul_type_set_sprite(bullet_shotgun, spr_bullet, 0, 0);
bul_type_set_radial(bullet_shotgun, 3, 30, true);
bul_type_set_scale(bullet_shotgun, 5, 1, -0.2, 0);
bul_type_set_friction(bullet_shotgun, 0.2);

// Laser bullet
bul_type_set_life(bullet_laser, 1);
bul_type_set_sprite(bullet_laser, spr_bullet, 0, 0);
bul_type_set_scale(bullet_laser, 100, 3, 0, 0);
bul_type_set_color(bullet_laser, c_lime);