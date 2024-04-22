// Controls
moveLeft = keyboard_check_direct(ord("A"))
moveRight = keyboard_check_direct(ord("D"))
jump = keyboard_check_direct(ord("W"))
crouch = keyboard_check_direct(ord("S"))

if moveLeft and phy_speed_x > -5 {
	//phy_speed_x = -normalSpeed;
	//physics_apply_force(x,y, -600, 0)
	physics_apply_impulse(x,y,-5*phy_mass,0)
	if place_meeting(x,y+1,oBlock) {
		sprite_index = sPlayer1Walking
		image_xscale = -1
	}
}



if moveRight and phy_speed_x < 5 {
	//phy_speed_x = normalSpeed;
	//physics_apply_force(x,y, 600, 0)
	physics_apply_impulse(x,y,5*phy_mass,0)
	if place_meeting(x,y+1,oStaticParent) {
		image_xscale = 1
		sprite_index = sPlayer1Walking
	}
}

if !place_meeting(x,y+1,oBlock) {
	sprite_index = sPlayer1
}

if (!moveLeft and !moveRight) {
	//phy_speed_x = 0	
	sprite_index = sPlayer1
}

if crouch and place_meeting(x,y+1,oStaticParent) {
	phy_speed_x = 0
	phy_speed_y = 0
}

//airborne test

if place_meeting(x,y+1,oStaticParent) {
	jumpBuffer = 0
}



if jump and !jumpCooldown and jumpBuffer < 2 {
	physics_apply_impulse(x,y,0,-65*phy_mass)
	jumpCooldown = true
	jumpBuffer += 1
	if isGrappled {
		alarm[0] = room_speed*4
	} else {
		alarm[0] = room_speed
	}
}

if(keyboard_check(ord("G")) && !isGrappled) {
	isGrappleBeingHeld = true;
	if(!instance_exists(grappleDirectionObj)) {
		grappleDirectionObj = instance_create_layer(x,y,"Instances", oGrappleDirection);
	}
	grappleDirectionObj.x = x;
	grappleDirectionObj.y = y;
}

if(keyboard_check_pressed(ord("G")) or keyboard_check_pressed(ord("O")) && isGrappled) {
	if instance_exists(hook) {
		with(hook) {
			if(grapplingPlayer == other) {
				for(i = 0; i < array_length(chainArray); i++) {
					instance_destroy(chainArray[i]);	
				}
			}
		}
	}
	//instance_destroy(hook.chainArray)
}

if(keyboard_check_released(ord("G")) && isGrappled) {
	isGrappled = false;
}

if(keyboard_check_released(ord("G")) && isGrappleBeingHeld) {
	isGrappleBeingHeld = false;
	
	hook = instance_create_layer(x,y,"Instances", oHook);
	with(hook) {
		
		force_x = lengthdir_x(15,other.grappleThrowingRotation);
		force_y = lengthdir_y(15,other.grappleThrowingRotation);
		
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
		var obj = instance_create_layer(x,y,"Instances", oGrappleDirection);
		obj.image_angle = grappleThrowingRotation;
		grappleDirectionObj = obj;
	}
	
}