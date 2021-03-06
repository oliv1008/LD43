extends Node2D

onready var BulletScene = preload("res://shmup/tir/BulletBoulet.tscn")

func _ready():

	$TimerBullet.start()
	
func _on_TimerBullet_timeout():
	var bullet = BulletScene.instance()
	bullet.position = $poubelle.position
	bullet.position.x -= 10
	bullet.position.y += 20
	bullet.speed = 300
	add_child(bullet)
	
func _on_Visibility_screen_exited():
	$poubelle/TimerFree.start()
	$TimerBullet.stop()
	
