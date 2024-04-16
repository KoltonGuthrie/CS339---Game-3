// Controls
moveLeft = keyboard_check_direct(ord("A"))
moveRight = keyboard_check_direct(ord("D"))
jump = keyboard_check_direct(ord("W"))
crouch = keyboard_check_direct(ord("S"))

if moveLeft and phy_speed_x > -5 {
	//phy_speed_x = -normalSpeed;
	//physics_apply_force(x,y, -600, 0)
	physics_apply_impulse(x,y,-50,0)
}

if moveRight and phy_speed_x < 5 {
	//phy_speed_x = normalSpeed;
	//physics_apply_force(x,y, 600, 0)
	physics_apply_impulse(x,y,50,0)
}

if (!moveLeft and !moveRight) {
	//phy_speed_x = 0	
}

if jump and place_meeting(x,y+1,oBlock) {
	physics_apply_impulse(x,y,0,-550)
}

if(keyboard_check(ord("G")) && !isGrappled) {
	isGrappleBeingHeld = true;
	if(!instance_exists(grappleDirectionObj)) {
		grappleDirectionObj = instance_create_layer(x,y,"Instances", oGrappleDirection);
	}
	grappleDirectionObj.x = x;
	grappleDirectionObj.y = y;
}

if(keyboard_check_pressed(ord("G")) && isGrappled) {
	with(hook) {
		if(grapplingPlayer == other) {
			for(i = 0; i < array_length(chainArray); i++) {
				instance_destroy(chainArray[i]);	
			}
		}
	}
}

if(keyboard_check_released(ord("G")) && isGrappled) {
	isGrappled = false;
}

if(keyboard_check_released(ord("G")) && isGrappleBeingHeld) {
	isGrappleBeingHeld = false;
	
	hook = instance_create_layer(x,y,"Instances", oHook);
	with(hook) {
		
		force_x = lengthdir_x(10,other.grappleThrowingRotation);
		force_y = lengthdir_y(10,other.grappleThrowingRotation);
		
		phy_position_x += force_x;
		phy_position_y += force_y;

		phy_speed_x = force_x;
		phy_speed_y = force_y;

		grapplingPlayer = other;
	}
	if(instance_exists(grappleDirectionObj)) instance_destroy(grappleDirectionObj);
	grappleDirectionObj = noone;
	isGrappled = true;
	grappleThrowingRotation = 0;
}


if(isGrappleBeingHeld) {
	if(grappleThrowingRotation >= 360) grappleThrowingRotation = 0;
	grappleThrowingRotation += 3;
	
	if(instance_exists(grappleDirectionObj)) {
		grappleDirectionObj.image_angle = grappleThrowingRotation;
	} else {
		obj = instance_create_layer(x,y,"Instances", oGrappleDirection);
		obj.image_angle = grappleThrowingRotation;
		grappleDirectionObj = obj;
	}
	
}