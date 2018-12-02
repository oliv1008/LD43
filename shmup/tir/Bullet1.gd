extends Node2D

export (int) var speed
var Diago
var angle = float(PI/8)
var Lateral = false

func _ready():
	pass

func _physics_process(delta):
	var velocity = Vector2()
	if Diago == -1:
		velocity.x = -cos(angle)
		velocity.y = sin(angle)
	elif Diago == 1:
		velocity.x = cos(angle)
		velocity.y = sin(angle)
	elif Diago == 2:
		velocity.x = cos(3*angle)
		velocity.y = sin(angle)
	elif Diago == -2:
		velocity.x = -cos(3*angle)
		velocity.y = sin(angle)
	else:
		velocity.y += 1
		
		
	velocity = velocity.normalized() * speed * delta
	position += velocity

func _on_Visibility_screen_exited():
    queue_free()

func _on_Area2D_body_entered(body):
	if body.is_in_group("Perso"):
		body._on_hit()
		queue_free()
