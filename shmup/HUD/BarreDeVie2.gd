extends ColorRect

func _physics_process(delta):
	rect_size.x = 269 * (float(playerData.boss1HP)/float(playerData.maxboss1HP))

