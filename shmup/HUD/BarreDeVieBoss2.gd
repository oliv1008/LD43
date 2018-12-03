extends ColorRect

func _physics_process(delta):
	rect_size.x = 269 * (float(playerData.boss2HP)/float(playerData.maxboss2HP))