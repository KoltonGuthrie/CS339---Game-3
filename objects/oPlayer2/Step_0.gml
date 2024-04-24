// Controls
moveLeft = keyboard_check_direct(vk_left)
moveRight = keyboard_check_direct(vk_right)
jump = keyboard_check_direct(vk_up)
crouch = keyboard_check_direct(vk_down)

if moveLeft and phy_speed_x > -5 {
	//phy_speed_x = -normalSpeed;
	//physics_apply_force(x,y, -600, 0)
	physics_apply_impulse(x,y,-5*phy_mass,0)
	if place_meeting(x,y+1,oBlock) {
		sprite_index = sPlayer2Walking
		image_xscale = -1
	}
}



if moveRight and phy_speed_x < 5 {
	//phy_speed_x = normalSpeed;
	//physics_apply_force(x,y, 600, 0)
	physics_apply_impulse(x,y,5*phy_mass,0)
	if place_meeting(x,y+1,oBlock) {
		image_xscale = 1
		sprite_index = sPlayer2Walking
	}
}

if !place_meeting(x,y+1,oBlock) {
	sprite_index = sPlayer2
}

if (!moveLeft and !moveRight) {
	//phy_speed_x = 0	
	sprite_index = sPlayer2
}

if crouch and place_meeting(x,y+1,oBlock) {
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
	
	alarm[0] = room_speed
	
}

if(keyboard_check(ord("L")) && !isGrappled) {
	isGrappleBeingHeld = true;
	if(!instance_exists(grappleDirectionObj)) {
		grappleDirectionObj = instance_create_layer(x,y,"Instances", oGrappleDirection);
	}
	grappleDirectionObj.x = x;
	grappleDirectionObj.y = y;
}

if((keyboard_check_pressed(ord("L")) or keyboard_check_pressed(ord("O"))) && isGrappled) {
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

if(keyboard_check_released(ord("L")) && isGrappled) {
	isGrappled = false;
}

if(keyboard_check_released(ord("L")) && isGrappleBeingHeld) {
	isGrappleBeingHeld = false;
	
	hook = instance_create_layer(x,y,"Instances", oHook);
	with(hook) {
		
		x_offset = 0;
		y_offset = 0;
		
		if(other.grappleThrowingRotation < 45) {
			x_offset = sprite_width * 1.5;
		} else if(other.grappleThrowingRotation < 135) {
			y_offset = - sprite_height * 2.5;
		} else if(other.grappleThrowingRotation < 225) {
			x_offset = -sprite_width * 1.5;
		} else if(other.grappleThrowingRotation < 315) {
			y_offset = sprite_height * 2.5;
		} else if(other.grappleThrowingRotation < 360) {
			x_offset = sprite_width * 1.5;
		}
		
		force_x = lengthdir_x(15,other.grappleThrowingRotation);
		force_y = lengthdir_y(15,other.grappleThrowingRotation);
		
		phy_position_x += force_x + x_offset;
		phy_position_y += force_y + y_offset;

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