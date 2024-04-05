
//CONTROL

moveRight = keyboard_check(ord("D"))
moveLeft = keyboard_check(ord("A"))
// moving right
if moveRight {
    // is there space for me to move right?
    if !place_meeting(x+normalSpeed, y, oCollision) {
        hspeed = normalSpeed
    }
}

// moving left
if moveLeft {
    // is there space for me to move left?
    if !place_meeting(x-normalSpeed, y, oCollision) {
        hspeed = -normalSpeed
    }
}

// jumping
// based on https://youtu.be/03Csfvg4n_8?t=241
if keyboard_check_pressed(vk_space) and place_meeting(x, y+normalGravity, oCollision){
jumpTimer = jumpHoldFrames	
}
if keyboard_check_released(vk_space) {jumpTimer = 0}
if jumpTimer > 0 and !place_meeting(x, y-jumpSpeed, oCollision){
	sprite_index = SPlayer
	vspeed = -jumpSpeed
	jumpTimer--
}




//PHYSICS

//Sprite Facing
//needs to be adjusted if we want them to face away from a wall when wall sliding
if hspeed > 0 { //facing right
	image_xscale = 1	
}
if hspeed < 0 { //facing left
	image_xscale = -1
}

// air physics
//includes wall slide
 if !place_meeting(x, y+normalGravity, oCollision) {
    gravity = normalGravity
	if place_meeting(x+normalSpeed, y, oCollision) and vspeed > 0 and keyboard_check(ord("D")) {
		//wallslide right
		gravity = normalGravity/wallSlideFriction
	} else if place_meeting(x-normalSpeed, y, oCollision) and vspeed > 0 and keyboard_check(ord("A")) {
		//wallslide left
		gravity = normalGravity/wallSlideFriction
	}else {		
	}
}

//Horizontal Friction
hspeed *= .7




//COLLISION

//Overwritten from collision object in case we need anything specific to the player
// horizontal collision
if place_meeting(x+hspeed, y, oCollision) {
    if hspeed < 0 {  // i'm about to hit on the left       
    }
    else { // i'm about to hit on the right      
    }
	var _pixelCheck = sign(hspeed)
	while !place_meeting(x+_pixelCheck, y, oCollision){
		x+= _pixelCheck	
	}
    hspeed = 0
}

// vertical collision
if place_meeting(x, y+vspeed+gravity, oCollision) {
    if vspeed < 0 {  // i'm about to hit on the top
    }
    else {  // i'm about to hit on the bottom	
        gravity = 0
    }
	var _pixelCheck = sign(vspeed)
	while !place_meeting(x, y+_pixelCheck, oCollision){
		y+= _pixelCheck	
	}
    vspeed = 0
}

// corner collision
if place_meeting(x+hspeed, y+vspeed+gravity, oCollision) {
    if vspeed < 0 {  // i'm about to hit on the top       
    }
    else { // i'm about to hit on the bottom   
    }
    hspeed = 0
	vspeed = 0
}