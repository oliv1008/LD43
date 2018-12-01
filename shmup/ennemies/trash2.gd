extends KinematicBody2D

var health = 5

export (int) var speed
export (String) var deplacement
var spawnPosition = Vector2()
var GD = 1
var velocity = Vector2()
var a = 0 # sert de paramètre au cos, augmente à chaque frame
var cosSpeed = 0.1
var amp = 100 # amplitude du cos
var nombreDeMort = 0


func _ready():
	position = spawnPosition
	if deplacement == "Horizontale Gauche":
		position.x = 0
		position.y = randi() % 201
	if deplacement == "Horizontale Droite":
		position.x = 800
		position.y = randi() % 201
		
	if deplacement == "GD":
		$TimerGD.start()
		
func _physics_process(delta):
	velocity = Vector2()
	if deplacement == "Diagonale":
		velocity.y += 1
		velocity.x += 1
		speed = 100
	if deplacement == "GD":
		velocity.y += 1
		velocity.x += GD
		speed = 50
	if deplacement == "Sinus":
		a += cosSpeed
		position.x = amp*cos(a) + spawnPosition.x
		position.y += 1
		velocity = Vector2(0,0)
	if deplacement == "Verticale":
		velocity.y += 1
	if deplacement == "Horizontale Gauche":
		velocity.x += 1
	if deplacement == "Horizontale Droite":
		velocity.x -= 1

	velocity = velocity.normalized() * speed * delta
	position += velocity
	
func _on_TimerGD_timeout():
	if GD == 1:
		GD = -1
	else:
		GD = 1

func _on_hit():
	health -= 1
	if health == 0:
		$TimerFree.start()
		$"../TimerBullet1".stop()
		$Sprite.position.x += 2000 
		$Sprite.position.y += 2000
		$hitbox.position.x += 2000 
		$hitbox.position.y += 2000
		playerData.nombreATuer -= 1
func _on_TimerFree_timeout():
	queue_free()

