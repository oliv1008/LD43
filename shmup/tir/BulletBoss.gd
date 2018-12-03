extends Node2D

var speed
var angle = 0

func _ready():
	pass

func _physics_process(delta):
	var velocity = Vector2()
	velocity.x = cos(angle)
	velocity.y = sin(angle)
	velocity = velocity * speed * delta
	position += velocity

func _on_Visibility_screen_exited():
	queue_free()

func _on_Area2D_body_entered(body):
	if body.is_in_group("Perso"):
		body._on_hit()
		queue_free()

func init(angle_param, speed_param):
	speed = speed_param
	angle = angle_param