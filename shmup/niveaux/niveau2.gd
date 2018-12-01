extends Node

export (PackedScene) var trash
export (PackedScene) var trash2

var randomDep = 0
var randomTrash = 0


func _ready():
	randomize()
	$TimerMob.start()
	$TimerStylePoubelle.start()
	
func _physics_process(delta):
	if playerData.nombreATuer == 0:
		_my_level_was_completed()


func _on_TimerMob_timeout():
	$TrashPath/TrashSpawnLocation.set_offset(randi())
	var my_trash = trash.instance()
	if randomTrash == 0:
		 my_trash = trash2.instance()
	my_trash.get_node("poubelle").spawnPosition = $TrashPath/TrashSpawnLocation.position
	if randomDep == 0:
		my_trash.get_node('poubelle').deplacement = "Diagonale"
	elif randomDep == 1:
		my_trash.get_node('poubelle').deplacement = "GD"
	elif randomDep == 2:
		my_trash.get_node('poubelle').deplacement = "Sinus"
	elif randomDep == 3:
		my_trash.get_node('poubelle').deplacement = "Horizontale Droite"
	elif randomDep == 4:
		my_trash.get_node('poubelle').deplacement = "Horizontale Gauche"
	elif randomDep == 5:
		my_trash.get_node('poubelle').deplacement = "Verticale"
		
	
	add_child(my_trash)

	
func _on_TimerStylePoubelle_timeout():
	randomDep = randi() % 6
	randomTrash = randi() % 3
	
func _my_level_was_completed():
	get_tree().change_scene("res://shmup/niveaux/niveau2.tscn")
	playerData.nombreATuer = 5