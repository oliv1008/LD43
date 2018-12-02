extends ColorRect

func _physics_process(delta):
	rect_size.x = 400 * (float(playerData.carHP)/float(playerData.maxCarHP))

