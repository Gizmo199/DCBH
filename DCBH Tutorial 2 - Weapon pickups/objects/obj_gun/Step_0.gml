gun_update();

ui_show = false;
if ( collision_circle(x, y, sprite_width*.5, obj_player, false, true) )
{
	ui_show = true;	
}
ui_alpha = lerp(ui_alpha, ui_show, 0.2);