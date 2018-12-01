extends Node2D

onready var ProjectileScene = preload("res://shmup/tir/projectile.tscn")

func _ready():
	$TimerProjec.start()
	pass

func _on_TimerProjec_timeout():
	var projectile = ProjectileScene.instance()
	projectile.position = $Voiture.position
	#projectile.rotation_degrees = 0
	add_child(projectile)
	
