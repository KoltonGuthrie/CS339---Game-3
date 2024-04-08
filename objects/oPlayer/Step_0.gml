// Controls
moveLeft = keyboard_check_direct(ord("A"))
moveRight = keyboard_check_direct(ord("D"))
jump = keyboard_check_direct(ord("W"))
crouch = keyboard_check_direct(ord("S"))

if moveLeft and !place_meeting(phy_position_x+phy_speed_x, y, oCollision) {
	phy_speed_x = -normalSpeed
}

if moveRight and !place_meeting(phy_position_x+phy_speed_x, y, oCollision) {
	phy_speed_x = normalSpeed
}

if (!moveLeft and !moveRight) or place_meeting(phy_position_x+phy_speed_x, y, oCollision) {
	phy_speed_x = 0	
}

if place_meeting(x,y+1,oCollision) {
	phy_speed_y = 0	
	physics_apply_force(phy_position_y,phy_position_x,0,phy_mass*-50)
}

if jump and place_meeting(x,y+1,oCollision) {
	physics_apply_impulse(x,y,0,-550)
}

if place_meeting(x,y+phy_speed_y,oCollision) {
	phy_speed_y = 0	
}

//if place_meeting(x, )