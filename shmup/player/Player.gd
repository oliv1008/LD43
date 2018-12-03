extends Node2D

onready var ProjectileScene = preload("res://shmup/tir/projectile.tscn")

func _ready():
	$TimerProjec.start()
	#playerData.playerRef = self
	pass

func _on_TimerProjec_timeout():
	var projectile = ProjectileScene.instance()
	projectile.position = $Voiture.position
	add_child(projectile)
	
