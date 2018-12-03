extends Node2D
var nbRobot = 0

onready var ProjectileScene = preload("res://shmup/tir/projectile.tscn")
onready var voitureA4 = preload("res://shmup/images/Voiture_4.png")
onready var voitureA3 = preload("res://shmup/images/Voiture_3.png")
onready var voitureA2 = preload("res://shmup/images/Voiture_2.png")
onready var voitureA1 = preload("res://shmup/images/Voiture_1.png")

func _ready():
	$TimerProjec.start()
	pass

func _on_TimerProjec_timeout():
	var projectile = ProjectileScene.instance()
	projectile.position = $Voiture.position
	projectile.position.x -= 22
	projectile.position.y -= 10
	projectile.degats = 5
	add_child(projectile)
	if playerData.seats[0] != null:
		projectile = ProjectileScene.instance()
		projectile.position = $Voiture.position
		projectile.degats = playerData.seats[0].attaque_value
		projectile.position.x += 28
		projectile.position.y -= 10
		nbRobot += 1
		add_child(projectile)
	if playerData.seats[1] != null:
		projectile = ProjectileScene.instance()
		projectile.position = $Voiture.position
		projectile.degats = playerData.seats[1].attaque_value
		projectile.position.x -= 30
		projectile.position.y += 10
		nbRobot += 1
		add_child(projectile)
	if playerData.seats[2] != null:
		nbRobot += 1
	if playerData.seats[3] != null:
		projectile = ProjectileScene.instance()
		projectile.position = $Voiture.position
		projectile.degats = playerData.seats[3].attaque_value 
		projectile.position.x += 15
		projectile.position.y += 10
		nbRobot += 1
		add_child(projectile)
		
	if nbRobot == 0:
		$Voiture/Sprite.texture = voitureA1
	if nbRobot == 1:
		$Voiture/Sprite.texture = voitureA2
	if nbRobot == 2:
		$Voiture/Sprite.texture = voitureA3
	if nbRobot == 3:
		$Voiture/Sprite.texture = voitureA4
	if nbRobot == 4:
		$Voiture/Sprite.texture = voitureA4
		
	
