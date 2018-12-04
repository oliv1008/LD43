extends Control

var pathToManagementScreen = "res://gestion/ManagementScreen/MainManagementScreen/MainManagementScreen.tscn"

func _ready():
	MusicPlayer.get_node("MusicStream").volume_db = 0
	MusicPlayer.brutalPlaySong("MainTheme")

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _input(event):
	if event.is_action_pressed("ui_accept"):
		get_tree().change_scene(pathToManagementScreen)