extends Node

export (PackedScene) var trash

var random = 0
var fin = 1


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
	my_trash.get_node("poubelle").spawnPosition = $TrashPath/TrashSpawnLocation.position
	if random == 0:
		my_trash.get_node('poubelle').deplacement = "Diagonale"
	elif random == 1:
		my_trash.get_node('poubelle').deplacement = "GD"
	elif random == 2:
		my_trash.get_node('poubelle').deplacement = "Sinus"
	elif random == 3:
		my_trash.get_node('poubelle').deplacement = "Horizontale Droite"
	elif random == 4:
		my_trash.get_node('poubelle').deplacement = "Horizontale Gauche"
	elif random == 5:
		my_trash.get_node('poubelle').deplacement = "Verticale"
		
	
	add_child(my_trash)

	
func _on_TimerStylePoubelle_timeout():
	random = randi() % 6
	
func _my_level_was_completed():
	get_tree().change_scene("res://shmup/niveaux/niveau1.tscn")
	playerData.nombreATuer = 5

