// Shadow
var xrad = sprite_width*0.5;
var yrad = xrad * 0.5;
var xx = x;
var yy = y + sprite_height*0.5;
draw_ellipse_color(xx - xrad, yy - yrad, xx + xrad, yy + yrad, c_black, c_black, false);

if ( weapon )
{
	with ( weapon )
	{
		draw_sprite_ext(
			sprite_index,
			image_index,
			x,
			( y - other.anim.z ) + other.sprite_height*0.5,
			image_xscale,
			image_yscale,
			image_angle,
			c_black,
			1
		);
	}
}

// Draw weapon function
var draw_weapon = function()
{
	if ( weapon )
	{
		with ( weapon ) draw_self();
	}
}

// Set the order we want to draw ourselves and the gun
var draw_order = [ anim.draw, draw_weapon ]
if ( weapon_dir < 180 )
{
	draw_order = [ draw_weapon, anim.draw ];
}

// Draw stuff
for ( var i=0; i<array_length(draw_order); i++ )
{
	draw_order[i]();	
}