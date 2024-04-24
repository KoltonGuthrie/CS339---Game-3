/// @description Insert description here
// You can write your code in this editor
if coins == 7 and !blockSpawned {
	instance_create_layer(x,y,"Instances",oBlock);
	blockSpawned = true;
}

if coins == 7 {
	if oPlayer1Escaped and oPlayer2Escaped and !ending {
		victoryHeader = "You both escaped!"
		victoryBody = "Y'all will live happy lives on the surface once more..."
		room_goto_next()
		ending = true
	}
	
} else {
	if oPlayer1Escaped and !ending {
		victoryHeader = "Player 1 escaped."
		victoryBody = "But he had to leave his friend behind..."
		room_goto_next()
		ending = true
	} else if oPlayer2Escaped and !ending {
		victoryHeader = "Player 2 escaped."
		victoryBody = "But she had to leave her friend behind..."
		room_goto_next()
		ending = true
	}
}
if instance_exists(oPlayer1) {
	if oPlayer1.y <= 0 {
		oPlayer1Escaped = true
		//instance_destroy(oPlayer1)
	} 
}

if instance_exists(oPlayer2) {
	if oPlayer2.y <= 0 {
		oPlayer2Escaped = true
		//instance_destroy(oPlayer2)
	}
}