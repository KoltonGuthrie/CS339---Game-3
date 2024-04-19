/// @description Insert description here
// You can write your code in this editor

if instance_exists(oCheckpoint1) {
	instance_destroy(oCheckpoint1)	
}

p1CheckpointX = phy_position_x
p1CheckpointY = phy_position_y

instance_create_layer(x,y,"Instances",oCheckpoint1)