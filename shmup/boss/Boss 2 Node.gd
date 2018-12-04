extends Node

var MainManagementScreen = "res://gestion/ManagementScreen/MainManagementScreen/MainManagementScreen.tscn"

func _ready():
	$AnimationPlayer.play("arrivee")

func _physics_process(delta):
	if playerData.boss2HP <= 0:
		queue_free()
		_my_level_was_completed()
		
func _my_level_was_completed():
	#playerData.nombreATuer = 5
	playerData.currentStage += 1
	MusicPlayer.get_node("MusicStream").volume_db = 0
	MusicPlayer.brutalPlaySong("EventTheme")
	get_tree().change_scene("res://gestion/ManagementScreen/EventScreen/Event7/Event7.tscn")

