/// @description Insert description here
// You can write your code in this editor

//direction = oHook.chainDirection
//phy_rotation = point_direction(x,y,oHook.chainArray[0].x,oHook.chainArray[0].y)-45
if(!variable_instance_exists(self, "parentHook")) parentHook = noone;

if(parentHook != noone) {
	phy_speed_x = parentHook.phy_speed_x;
	phy_speed_y = parentHook.phy_speed_y;
}