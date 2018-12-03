extends Node

var MainManagementScreen = "res://gestion/ManagementScreen/MainManagementScreen/MainManagementScreen.tscn"

func _ready():
	$AnimationPlayer.play("arrivee")

func _physics_process(delta):
	if playerData.boss3HP <= 0:
		queue_free()
		_my_level_was_completed()
		
func _my_level_was_completed():
	#playerData.nombreATuer = 5
	playerData.currentStage = 0
	get_tree().change_scene(MainManagementScreen)

