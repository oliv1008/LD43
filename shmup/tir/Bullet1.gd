extends Node2D

export (int) var speed

func _ready():
	pass

func _physics_process(delta):
	var velocity = Vector2()
	velocity.y += 1
	velocity = velocity.normalized() * speed * delta
	position += velocity

func _on_Visibility_screen_exited():
    queue_free()

func _on_Area2D_body_entered(body):
	if body.is_in_group("Perso"):
		body._on_hit()
		queue_free()
