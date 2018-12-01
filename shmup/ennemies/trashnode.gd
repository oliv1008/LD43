extends Node2D

onready var Bullet1Scene = preload("res://shmup/tir/Bullet1.tscn")

func _ready():

	$TimerBullet1.start()
	pass

func _on_TimerBullet1_timeout():
	var bullet1 = Bullet1Scene.instance()
	bullet1.position = $poubelle.position
	#projectile.rotation_degrees = 0
	add_child(bullet1)
	
