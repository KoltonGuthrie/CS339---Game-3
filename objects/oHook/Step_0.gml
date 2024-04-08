// readjusts angle for newly spawned chains
chainDirection = point_direction(startPointX,startPointY,x,y)
//phy_rotation = point_direction(startPointX,startPointY,x,y)

// acquires x and y values of most recent chain
chainX = chainArray[0].x
chainY = chainArray[0].y

// tests if hook is grappled onto another object
if !grappled and array_length(chainArray) < chainLength-1 {
	//show_message("This first statement is read")
	if (point_distance(startPointX,startPointY,chainX,chainY) >= 24) {
		//show_message("This second statement is read")
		array_insert(chainArray, 0, instance_create_layer(startPointX,startPointY,"Instances",oChain))
		physics_joint_revolute_create(chainArray[1], chainArray[0],chainX,chainY,0,180,true,0,0,false,false)
		chains++
	}
} else if array_length(chainArray) == chainLength-1 {
	if (point_distance(startPointX,startPointY,chainX,chainY) >= 24) {
		physics_joint_revolute_create(oPlayer, chainArray[0],oPlayer.x,oPlayer.y,0,180,true,0,0,false,false)
		chains++
	}
}

// attempts to grapple
