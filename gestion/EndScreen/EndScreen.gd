extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	MusicPlayer.get_node("MusicStream").brutalPlaySong("musique_fin")
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Button_pressed():
	get_tree().quit()
