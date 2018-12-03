extends Node2D

export (int) var speed
var angle
var playerPosition

func _ready():
	playerPosition = playerData.playerRef.get_global_position()
	angle =  get_angle_to(playerPosition)
	pass

func _physics_process(delta):
	var velocity = Vector2()
	velocity.x = cos(angle)
	velocity.y = sin(angle)
	velocity = velocity.normalized() * speed * delta
	position += velocity

func _on_Visibility_screen_exited():
    queue_free()

func _on_Area2D_body_entered(body):
	if body.is_in_group("Perso"):
		body._on_hit()
		queue_free()