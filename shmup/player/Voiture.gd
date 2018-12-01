extends KinematicBody2D

export (int) var speed
var screensize
var rotDeg = 15

var health = 2

func _on_hit():
	health -= 1
	if health == 0:
		$"../TimerProjec".stop()
	#Lorsqu'un projectile rencontre le player, on baisse la vie etc
	
func _ready():
	screensize = get_viewport_rect().size

func _physics_process(delta):
	var velocity = Vector2()
	if Input.is_action_pressed("right"):
		velocity.x += 1
		rotation_degrees = rotDeg
	if Input.is_action_pressed("left"):
		velocity.x -= 1
		rotation_degrees = -rotDeg
	if Input.is_action_pressed("down"):
		velocity.y += 1
		rotation_degrees = 0
	if Input.is_action_pressed("up"):
		velocity.y -= 1
		rotation_degrees = 0
	if Input.is_action_pressed("right") and Input.is_action_pressed("down"):
		rotation_degrees = -rotDeg
	if Input.is_action_pressed("left") and Input.is_action_pressed("down"):
		rotation_degrees = rotDeg
	if Input.is_action_pressed("right") and Input.is_action_pressed("up"):
		rotation_degrees = rotDeg
	if Input.is_action_pressed("left") and Input.is_action_pressed("up"):
		rotation_degrees = -rotDeg
	if Input.is_action_pressed("left") and Input.is_action_pressed("right"):
		rotation_degrees = 0
	if Input.is_action_pressed("mouvementRot"):
		pass
	else:
		rotation_degrees = 0
	if velocity.length() > 0:
		if Input.is_action_pressed("slow"):
			velocity = velocity.normalized() * speed * 0.5 * delta
		else:
			velocity = velocity.normalized() * speed * delta
		move_and_collide(velocity)

		position += velocity
		position.x = clamp(position.x, 0, screensize.x)
		position.y = clamp(position.y, 0, screensize.y)



