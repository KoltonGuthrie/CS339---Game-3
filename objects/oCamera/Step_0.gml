//Currently only set to follow the player, but we could have an object that stays in the midpoint between the 2 and have it follow that

p1x = oPlayer1.x
p1y = oPlayer1.y
p2x = oPlayer2.x
p2y = oPlayer2.y

x = p1x + (point_distance(p1x,y,p2x,y)/2)
y = p1y + (point_distance(x,p1y,x,p2y)/2)