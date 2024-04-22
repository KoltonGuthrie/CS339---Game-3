if(instance_exists(grapplingPlayer) && instance_exists(chainArray[0])) {

	// readjusts angle for newly spawned chains
	//chainDirection = point_direction(grapplingPlayer.x, grapplingPlayer.y,x,y)
	//phy_rotation = point_direction(startPointX,startPointY,x,y)

	// acquires x and y values of most recent chain
	chainX = chainArray[0].x
	chainY = chainArray[0].y

	// tests if hook is grappled onto another object
	if !grappled and array_length(chainArray) < chainLength-1 {
		//show_message("This first statement is read")
		if (point_distance(grapplingPlayer.x,grapplingPlayer.y,chainX,chainY) >= 24) {
			//show_message("This second statement is read")
			array_insert(chainArray, 0, instance_create_layer(grapplingPlayer.x,grapplingPlayer.y,"Instances",oChain, {parentHook: self.id}))
			physics_joint_rope_create(chainArray[1], chainArray[0], chainArray[1].x, chainArray[1].y, chainArray[0].x + 24, chainArray[0].y, 12, false)
			chains++
		}
	} else if array_length(chainArray) == chainLength-1 {
		if (point_distance(grapplingPlayer.x,grapplingPlayer.y,chainX,chainY) >= 24) {
			physics_joint_rope_create(chainArray[0], grapplingPlayer, chainArray[0].x, chainArray[0].y, grapplingPlayer.x, grapplingPlayer.y, 3, false)
			chains++
			physics_joint_rope_create(self, grapplingPlayer, self.x, self.y, grapplingPlayer.x, grapplingPlayer.y, 35 * chains, false)
		}
	}
}
/*
if instance_exists(originJoint) {
	x = originJoint.x
	y = originJoint.y
}
*/

// attempts to grapple
