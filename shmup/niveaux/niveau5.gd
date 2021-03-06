extends Node

export (PackedScene) var trash
export (PackedScene) var trash2
export (PackedScene) var MobShotgun
export (PackedScene) var MobLaser
export (PackedScene) var MobCanon

var randomDep = 0
var randomTrash = 0
var my_trash


func _ready():
	playerData.nombreATuer = 35
	randomize()
	$TimerMob.start()
	$TimerStylePoubelle.start()
	playerData.playShmupSong()
	
func _physics_process(delta):
	if playerData.nombreATuer <= 0:
		$TimerMob.stop()
		get_tree().call_group("Ennemies", "queue_free")
		playerData.niveauFini = true
		_my_level_was_completed()

func _on_TimerMob_timeout():
	$TrashPath/TrashSpawnLocation.set_offset(randi())
	
	if randomTrash == 1:
		my_trash = trash.instance()
		randomDep = randi() % 4
	elif randomTrash == 2:
		my_trash = MobCanon.instance()
		randomDep = randi() % 4
	elif randomTrash == 0:
		my_trash = MobShotgun.instance()
		randomDep = randi() % 4
	elif randomTrash == 4:
		my_trash = trash2.instance()
		randomDep = 4 + randi() % 4
	elif randomTrash == 3:
		my_trash = MobLaser.instance()
		randomDep = 3
	
	my_trash.get_node("poubelle").spawnPosition = $TrashPath/TrashSpawnLocation.position
	if randomDep == 0:
		my_trash.get_node('poubelle').deplacement = "Diagonale"
	elif randomDep == 1:
		my_trash.get_node('poubelle').deplacement = "GD"
	elif randomDep == 2:
		my_trash.get_node('poubelle').deplacement = "Sinus"
	elif randomDep == 5:
		my_trash.get_node('poubelle').deplacement = "Horizontale Droite"
	elif randomDep == 4:
		my_trash.get_node('poubelle').deplacement = "Horizontale Gauche"
	elif randomDep == 3:
		my_trash.get_node('poubelle').deplacement = "Verticale"
	elif randomDep == 6:
		my_trash.get_node('poubelle').deplacement = "Up and Down Gauche"
	elif randomDep == 7:
		my_trash.get_node('poubelle').deplacement = "Up and Down Droite"
		
	
	add_child(my_trash)

	
func _on_TimerStylePoubelle_timeout():
	randomDep = randi() % 8
	randomTrash = randi() % 5
	
func _my_level_was_completed():
	$TimerStylePoubelle.stop()
	if playerData.lanceBoss == true:
		#playerData.nombreATuer = 5
		playerData.lanceBoss = false
		playerData.niveauFini = false
		playerData.playerRef = $Player/Voiture.position
		get_tree().change_scene("res://shmup/boss/Boss 3.tscn")