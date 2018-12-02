extends Sprite

export (int) var speed

func _physics_process(delta):
	position = (Vector2(400, position.y + speed * delta))
	if position.y >= +1040:
		position.y = 0