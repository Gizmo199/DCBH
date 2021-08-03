// Draw weapon function
var draw_weapon = function()
{
	if ( weapon )
	{
		with ( weapon ) draw_self();
	}
}

// Set the order we want to draw ourselves and the gun
var draw_order = [ draw_self, draw_weapon ]
if ( weapon_dir < 180 )
{
	draw_order = [ draw_weapon, draw_self ];
}

// Draw stuff
for ( var i=0; i<array_length(draw_order); i++ )
{
	draw_order[i]();	
}