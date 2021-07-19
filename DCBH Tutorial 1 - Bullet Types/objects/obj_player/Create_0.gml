// Setup bullet
bullet = new bul_type();
bul_type_set_life(bullet, 60);
bul_type_set_sprite(bullet, spr_bullet, 0, 0);
bul_type_set_radial(bullet, 5, 30, true);
bul_type_set_friction(bullet, 0.2);
bul_type_set_scale(bullet, 5, 1, -0.2, 0);

// The speed of our bullet(s)
bullet_speed = 10;