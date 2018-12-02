
extends KinematicBody2D

onready var BulletScene = preload("res://shmup/tir/BulletBoss.tscn")
onready var LockScene = preload("res://shmup/tir/BulletLock.tscn")
export (PackedScene) var MobLaser
var my_trash

func _ready():
	$TimerSpirale.start()
	$TimerDebutShotgun.start()
	$TimerBullet.start()
	$TimerMob.start()
	$TimerDebutPluie.start()
	

func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	pass

func _on_hit():
	playerData.boss3HP -= 1
	if playerData.boss3HP == 0:
		$TimerSpirale.stop()
		$TimerDebutShotgun.stop()
		$TimerBullet.stop()
		$TimerMob.stop()
		$TimerDebutPluie.stop()
		queue_free()
		
func _bullet_spirale(nbBullet, speed, pos):
	var Liste_angle = []
	var coefficient = float(2*PI/nbBullet)
	for i in range (1, nbBullet):
		Liste_angle.append(float(coefficient*i))
	for i in range (0, nbBullet-1):
		var bullet = BulletScene.instance()
		bullet.position = pos
		bullet.angle = Liste_angle[i]
		bullet.speed = speed
		add_child(bullet)

func _triple_spirale():
	_bullet_spirale(30, 200, Vector2(0,0))
	_bullet_spirale(30, 200, Vector2(-100,100))
	_bullet_spirale(30, 200, Vector2(100,100))

func _dix_shotgun_sept():
	var Liste_angle = []
	for i in range (1, 4):
		Liste_angle.append(float(i*PI/8)+float(PI/2))
	for i in range (1, 4):
		Liste_angle.append(float(-i*PI/8)+float(PI/2))
	for i in range (0, 6):
		var bullet = BulletScene.instance()
		bullet.position = Vector2(0,0)
		bullet.angle = Liste_angle[i]
		bullet.speed = 600
		add_child(bullet)

func _bullet_pluie():
	var Liste_positionx = []
	for i in range (1, 6):
		Liste_positionx.append(i*150)
	for i in range (0, 5):
		var bullet = BulletScene.instance()
		bullet.position = Vector2(-500+Liste_positionx[i],-200)
		bullet.angle = float(PI/2)
		bullet.speed = 400
		add_child(bullet)
		
		

func _start_shotgun():
	$TimerShotgun.start()
	$TimerFinShotgun.start()
	
func _start_pluie():
	$TimerPluie.start()
	$TimerFinPluie.start()

func _on_TimerSpirale_timeout():
	_triple_spirale()
	
func _on_TimerShotgun_timeout():
	_dix_shotgun_sept()

func _on_TimerFinShotgun_timeout():
	$TimerShotgun.stop()

func _on_TimerDebutShotgun_timeout():
	_start_shotgun()
	
func _on_TimerBullet_timeout():
	var bullet = LockScene.instance()
	bullet.position = Vector2(0,0)
	add_child(bullet)
	
func _on_TimerMob_timeout():
	my_trash = MobLaser.instance()
	my_trash.position = Vector2(50-randi() % 200,0)
	add_child(my_trash)

func _on_TimerPluie_timeout():
	_bullet_pluie()

func _on_TimerFinPluie_timeout():
	$TimerPluie.stop()


func _on_TimerDebutPluie_timeout():
	_start_pluie()
