gun_init();
var guntype = choose( gun_set_pistol, gun_set_shotgun, gun_set_laser );
guntype();

ui_show = false;
ui_alpha = 0;