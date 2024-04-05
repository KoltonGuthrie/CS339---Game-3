//UNIVERSAL COLLISION CODE
//*needs to have a parented collision object*
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
if place_meeting(x, y+vspeed, oCollision) {
    if vspeed < 0 {  // i'm about to hit on the top
    }
    else {  // i'm about to hit on the bottom	
    }
	var _pixelCheck = sign(vspeed)
	while !place_meeting(x, y+_pixelCheck, oCollision){
		y+= _pixelCheck	
	}
    vspeed = 0
}

// corner collision
if place_meeting(x+hspeed, y+vspeed, oCollision) {
    if vspeed < 0 {  // i'm about to hit on the top       
    }
    else { // i'm about to hit on the bottom   	
    }
	hspeed = 0
	vspeed = 0
}

