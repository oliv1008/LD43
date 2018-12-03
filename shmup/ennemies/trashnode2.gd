extends Node2D

onready var BulletScene = preload("res://shmup/tir/Bullet1.tscn")

func _ready():

	$TimerBullet.start()
	
func _on_TimerBullet_timeout():
	var bullet = BulletScene.instance()
	bullet.position = $poubelle.position
	bullet.position.x += 25
	add_child(bullet)
	bullet = BulletScene.instance()
	bullet.position = $poubelle.position
	bullet.position.x -= 25
	add_child(bullet)
	
func _on_Visibility_screen_exited():
	$poubelle/TimerFree.start()
	$TimerBullet.stop()
	
