// Controls
<<<<<<< HEAD:objects/oPlayer2/Step_0.gml
moveLeft = keyboard_check_direct(vk_left)
moveRight = keyboard_check_direct(vk_right)
jump = keyboard_check_direct(vk_up)
crouch = keyboard_check_direct(vk_down)
=======
moveLeft = keyboard_check_direct(ord("A"))
moveRight = keyboard_check_direct(ord("D"))
//jump = keyboard_check_direct(ord("W"))
crouch = keyboard_check_direct(ord("S"))
>>>>>>> 49d4180d518e6151edc3e937f2be72b77761ed3f:objects/oPlayer/Step_0.gml

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

if keyboard_check_pressed(ord("W")) and place_meeting(x, y+normalGravity, oStaticParent){
	jumpTimer = jumpHoldFrames    
	}
	if keyboard_check_released(ord("W")) {jumpTimer = 0}
	if jumpTimer > 0 and !place_meeting(x, y-jumpSpeed, oStaticParent){
	      phy_speed_y = -jumpSpeed      
	      jumpTimer--
}

if(keyboard_check(ord("L")) && !isGrappled) {
	isGrappleBeingHeld = true;
	if(!instance_exists(grappleDirectionObj)) {
		grappleDirectionObj = instance_create_layer(x,y,"Instances", oGrappleDirection);
	}
	grappleDirectionObj.x = x;
	grappleDirectionObj.y = y;
}

<<<<<<< HEAD:objects/oPlayer2/Step_0.gml
if(keyboard_check_pressed(ord("L")) && isGrappled) {
	with(hook) {
=======
if(keyboard_check_pressed(ord("G")) && isGrappled) {
	with(oHook) {
>>>>>>> 49d4180d518e6151edc3e937f2be72b77761ed3f:objects/oPlayer/Step_0.gml
		if(grapplingPlayer == other) {
			for(i = 0; i < array_length(chainArray); i++) {
				instance_destroy(chainArray[i]);	
			}
		}
	}
}

if(keyboard_check_released(ord("L")) && isGrappled) {
	isGrappled = false;
}

if(keyboard_check_released(ord("L")) && isGrappleBeingHeld) {
	isGrappleBeingHeld = false;
	
	hook = instance_create_layer(x,y,"Instances", oHook);
	with(hook) {
		
		force_x = lengthdir_x(13,other.grappleThrowingRotation);
		force_y = lengthdir_y(13,other.grappleThrowingRotation);

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