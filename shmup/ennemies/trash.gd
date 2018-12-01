extends KinematicBody2D

var health = 30

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _on_hit():
	health -= 1
	if health == 0:
		$"../TimerBullet1".stop()
		queue_free()
	

