extends Control

func _ready():
	$Timer.start()

func _on_Button_pressed():
	get_tree().quit()

func _on_Timer_timeout():
	MusicPlayer.get_node("MusicStream").stop()
