//Currently only set to follow the player, but we could have an object that stays in the midpoint between the 2 and have it follow that

//update dest.
	xTo = (oPlayer1.x + oPlayer2.x)/2
	yTo = (oPlayer1.y + oPlayer2.y)/2

//update obj position
x += (xTo - x) / 10;
y += (yTo - y) / 2;


x = clamp(x, view_w_half, room_width - view_w_half);
y = clamp(y, view_h_half, room_height - view_h_half);

//update cam view
camera_set_view_pos(cam, x - view_w_half, y - view_h_half)


/*
p1x = oPlayer1.x
p1y = oPlayer1.y
p2x = oPlayer2.x
p2y = oPlayer2.y

x = p1x + (point_distance(p1x,y,p2x,y)/2)
y = p1y + (point_distance(x,p1y,x,p2y)/2)