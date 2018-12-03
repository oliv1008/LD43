extends KinematicBody2D

var health = 90

export (int) var speed
export (String) var deplacement
var spawnPosition = Vector2()
var GD = 1
var velocity = Vector2()
var a = 0 # sert de paramètre au cos, augmente à chaque frame
var cosSpeed = 0.1
var ampC = 100 # amplitude du cos
var ampS = 10 # amplitude du sin
var nombreDeMort = 0


func _ready():
	position = spawnPosition
	if deplacement == "Horizontale Gauche":
		position.x = 0
		position.y = randi() % 201
	if deplacement == "Horizontale Droite":
		position.x = 800
		position.y = randi() % 201
	if deplacement == "Up and Down Gauche":
		position.x = 0
		position.y = randi() % 201
	if deplacement == "Up and Down Droite":
		position.x = 800
		position.y = randi() % 201
		
	if deplacement == "GD":
		$TimerGD.start()
		
func _physics_process(delta):
	velocity = Vector2()
	if deplacement == "Horizontale Gauche":
		velocity.x += 1
	if deplacement == "Horizontale Droite":
		velocity.x -= 1
	if deplacement == "Up and Down Gauche":
		a += cosSpeed
		position.x += 1 
		position.y += float(ampS*sin(a)) #+ spawnPosition.y 
	if deplacement == "Up and Down Droite":
		a += cosSpeed
		position.x -= 1 
		position.y += float(ampS*sin(a)) #+ spawnPosition.y

	velocity = velocity.normalized() * speed * delta
	position += velocity
	
func _on_TimerGD_timeout():
	if GD == 1:
		GD = -1
	else:
		GD = 1

func _on_hit(degats):
	health -= degats
	if health <= 0:
		$TimerFree.start()
		$"../TimerBullet".stop()
		$Sprite.position.x += 2000 
		$Sprite.position.y += 2000
		$hitbox.position.x += 2000 
		$hitbox.position.y += 2000
		playerData.nombreATuer -= 1
func _on_TimerFree_timeout():
	queue_free()

