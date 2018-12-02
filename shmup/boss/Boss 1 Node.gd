extends Node

func _physics_process(delta):
	if playerData.boss1HP == 0:
		queue_free()
		_my_level_was_completed()
		
func _my_level_was_completed():
	playerData.nombreATuer = 10
	get_tree().change_scene("res://shmup/niveaux/niveau2.tscn")

