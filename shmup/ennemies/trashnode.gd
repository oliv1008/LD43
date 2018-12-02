extends Node2D

onready var BulletScene = preload("res://shmup/tir/BulletLock.tscn")

func _ready():

	$TimerBullet.start()
	
func _on_TimerBullet_timeout():
	var bullet = BulletScene.instance()
	bullet.position = $poubelle.position
	bullet.position.x -= 15
	bullet.position.y += 45
	add_child(bullet)
	
func _on_Visibility_screen_exited():
	queue_free()
	
