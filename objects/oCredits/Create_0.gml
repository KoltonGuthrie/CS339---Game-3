yy=room_height;
header_font = fn_Ubuntu;
subheader_font = fn_menu;
body_font = fn_Ubuntu_small;
header_extra_padding = 2.5;
subheader_extra_padding = 2;
body_extra_padding = 1.5;

text = [
	{"type": "subheader", "text": Score_Keeper.victoryHeader},
	{"type": "body", "text": Score_Keeper.victoryBody},
	{"type": "header", "text": "Rage Cave"},
	{"type": "header", "text": "Credits"},
	{"type": "subheader", "text": "Sounds"},
	{"type": "body", "text": "GrappleThrow: https://pixabay.com/sound-effects/movement-swipe-whoosh-3-186577/"},
	{"type": "body", "text": "GrappleAttach: https://pixabay.com/sound-effects/grappling-hook-14680/"},
	{"type": "body", "text": "Ambience: Void from the Explore Soundtrack by Ben Prunty"},
]

height = 0;

for(i = 0; i < array_length(text); i++) {
	
	if(text[i].type == "header") {
		draw_set_font(header_font)
		height += string_height("A") * header_extra_padding;
	} else if(text[i].type == "subheader") {
		draw_set_font(subheader_font)
		height += string_height("A") * subheader_extra_padding;
	} else if(text[i].type == "body") {
		draw_set_font(body_font)
		height += string_height("A") * body_extra_padding;
	}
	
	drawReset();
}