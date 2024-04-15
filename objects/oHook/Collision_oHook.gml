/// @description Insert description here
// You can write your code in this editor
/*
phy_speed_x = 0;
phy_speed_y = 0;
x = x;
y = y;

connectToX = x;
connectToY = y;

if(other.x - other.sprite_width / 2 > x) { // Left side
	connectToX = other.x - other.sprite_width / 2;
} else if(other.x + other.sprite_width / 2 < x) { // Right side
	connectToX = other.x + other.sprite_width / 2;
} else if(other.y - other.sprite_height / 2 > y) { // Top
	connectToY = other.y - other.sprite_height / 2;
} else if(other.y + other.sprite_height / 2 < y) { // Bottom
	connectToY = other.y + other.sprite_height / 2;
}

physics_joint_weld_create(self, other, connectToX, connectToY, 0, -1, 0, false);

//physics_joint_weld_create(self, other, other.x,other.y, 0, 0.1, 0, false);
*/