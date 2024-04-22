//Making the button interactible and changecolors when its hovering
hovering = position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id);

if (hovering && mouse_check_button_pressed(mb_left)) 
{
	clicked = true;
} 

if (mouse_check_button_released(mb_left)) 
{
	clicked = false;
//If the mouse is hovering over the button, it changes the sprites
//After button is clicked, plays a sound and then goes to the next room
	if (hovering) 
	{
		room_goto_next();
	}
} 

//Changes the sprites when clicked and hovering
if (clicked) 
{
	image_index = 2;
} 
else if (hovering) 
{
	image_index = 1;
} 
else 
{
	image_index = 0;
} 