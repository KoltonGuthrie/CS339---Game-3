/// @description Insert description here
// You can write your code in this editor

if instance_exists(oCheckpoint2) {
	instance_destroy(oCheckpoint2)	
}

p2CheckpointX = phy_position_x
p2CheckpointY = phy_position_y

instance_create_layer(x,y,"Instances",oCheckpoint2)