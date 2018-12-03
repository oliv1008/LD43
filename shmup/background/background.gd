extends Sprite

var triple_loop = 0
export (int) var speed

func _physics_process(delta):
	position = (Vector2(400, position.y + speed * delta))
	if position.y >= +1040:
		position.y = 0
		if playerData.niveauFini == true:
			triple_loop += 1 
			print("triple_loop", triple_loop)
			if triple_loop == 3:
				triple_loop = 0
				playerData.lanceBoss = true
				

