extends ColorRect

func _physics_process(delta):
	rect_size.x = 269 * (float(playerData.boss3HP)/float(playerData.maxboss3HP))