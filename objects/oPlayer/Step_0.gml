// Controls
moveLeft = keyboard_check_direct(ord("A"))
moveRight = keyboard_check_direct(ord("D"))
jump = keyboard_check_direct(ord("W"))
crouch = keyboard_check_direct(ord("S"))

if moveLeft {
	//phy_speed_x = -normalSpeed;
	//physics_apply_force(x,y, -600, 0)
	physics_apply_impulse(x,y,-20,0)
}

if moveRight {
	//phy_speed_x = normalSpeed;
	//physics_apply_force(x,y, 600, 0)
	physics_apply_impulse(x,y,20,0)
}

if (!moveLeft and !moveRight) {
	//phy_speed_x = 0	
}

if jump and place_meeting(x,y+1,oBlock) {
	physics_apply_impulse(x,y,0,-550)
}

if(keyboard_check_pressed(ord("G"))) {
	hook = instance_create_layer(x,y,"Instances", oHook);
	with(hook) {
		physics_apply_force(x,y,2,2);
		grapplingPlayer = other;
	}
}

//if place_meeting(x, )