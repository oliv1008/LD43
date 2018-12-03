extends Node

var MainManagementScreen = "res://gestion/ManagementScreen/MainManagementScreen/MainManagementScreen.tscn"

func _physics_process(delta):
	if playerData.boss1HP == 0:
		queue_free()
		_my_level_was_completed()
		
func _my_level_was_completed():
	playerData.nombreATuer = 5
	playerData.currentStage += 1
	get_tree().change_scene(MainManagementScreen)

