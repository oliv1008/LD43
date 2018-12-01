extends Node2D

onready var Bullet1Scene = preload("res://shmup/tir/Bullet1.tscn")

func _ready():

	$TimerBullet1.start()
	
func _on_TimerBullet1_timeout():
	var bullet1 = Bullet1Scene.instance()
	bullet1.position = $poubelle.position
	bullet1.position.x += 25
	add_child(bullet1)
	var bullet2 = Bullet1Scene.instance()
	bullet2.position = $poubelle.position
	bullet2.position.x -= 25
	add_child(bullet2)
	
func _on_Visibility_screen_exited():
	queue_free()
	
