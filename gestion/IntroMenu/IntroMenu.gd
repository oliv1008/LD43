extends Control

var pathToManagementScreen = "res://gestion/ManagementScreen/MainManagementScreen/MainManagementScreen.tscn"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _input(event):
	if event.is_action_pressed("ui_accept"):
		get_tree().change_scene(pathToManagementScreen)