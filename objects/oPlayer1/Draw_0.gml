/// @description Insert description here
// You can write your code in this editor
if !Score_Keeper.oPlayer1Escaped {
	draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,1,0,c_white,1)
	
	if jumpBuffer = 0 {
		draw_sprite_ext(sJumpBuffer,0,x+72,y-102,1,1,0,c_aqua,1)
		draw_sprite_ext(sJumpBuffer,0,x+72,y-78,1,1,0,c_aqua,1)
	} else if jumpBuffer = 1 {
		draw_sprite_ext(sJumpBuffer,0,x+72,y-102,1,1,0,c_aqua,1)
		draw_sprite_ext(sJumpBuffer,0,x+72,y-78,1,1,0,c_gray,1)
	} else {
		draw_sprite_ext(sJumpBuffer,0,x+72,y-102,1,1,0,c_gray,1)
		draw_sprite_ext(sJumpBuffer,0,x+72,y-78,1,1,0,c_gray,1)
	}
} else {
	
}

