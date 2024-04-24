image_speed = 0

chainLength = 10

chainArray = [self]
chains = 1

grappled = false
chainSize = 24

//direction = 0
//phy_rotation = direction
//phy_speed_y = -6
//aphy_speed_x = 6
chainDirection = direction
chainSpeed = speed

chainX = x
chainY = y
chainCounter = 0
audio_play_sound(GrappleThrow,1,false)
startModX = x%16
grapplingPlayer = pointer_null;

isChainDone = false;

grappleReady = false;
notGrappled = true;
alarm[0] = 0.1*room_speed;