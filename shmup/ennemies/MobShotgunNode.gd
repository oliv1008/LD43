extends Node2D

onready var BulletScene = preload("res://shmup/tir/Bullet1.tscn")

func _ready():

	$TimerBullet.start()
	
func _on_TimerBullet_timeout():
	var bullet = BulletScene.instance()
	bullet.position = $poubelle.position
	bullet.position.x -= 20
	bullet.position.y += 10
	bullet.Diago = 1
	add_child(bullet)
	bullet = BulletScene.instance()
	bullet.position = $poubelle.position
	bullet.position.x -= 20
	bullet.position.y += 10
	bullet.Diago = -1
	add_child(bullet)
	bullet = BulletScene.instance()
	bullet.position = $poubelle.position
	bullet.position.x -= 20
	bullet.position.y += 10
	bullet.Diago = 0
	add_child(bullet)
	bullet = BulletScene.instance()
	bullet.position = $poubelle.position
	bullet.position.x -= 20
	bullet.position.y += 10
	bullet.Diago = 2
	add_child(bullet)
	bullet = BulletScene.instance()
	bullet.position = $poubelle.position
	bullet.position.x -= 20
	bullet.position.y += 10
	bullet.Diago = -2
	add_child(bullet)
	
func _on_Visibility_screen_exited():
	queue_free()
	
