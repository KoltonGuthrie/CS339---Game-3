//Currently only set to follow the player, but we could have an object that stays in the midpoint between the 2 and have it follow that


//update dest.
if (instance_exists(follow))
{
	xTo = follow.x-25;
	yTo = follow.y-25;
}
//update obj position
x += (xTo - x) / 10;
y += (yTo - y) / 2;
x = clamp(x, view_w_half, room_width - view_w_half);
y = clamp(y, view_h_half, room_height - view_h_half);
//update cam view
camera_set_view_pos(cam, x - view_w_half, y - view_h_half)
