extends KinematicBody2D

var health = 70

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
	if deplacement == "GD":
		$TimerGD.start()
		
func _physics_process(delta):
	velocity = Vector2()
	if deplacement == "Diagonale":
		velocity.y += 1
		velocity.x += 1
	if deplacement == "GD":
		velocity.y += 1
		velocity.x += GD
	if deplacement == "Sinus":
		a += cosSpeed
		position.x = float(ampC*cos(a)) + spawnPosition.x
		position.y += 1
		velocity = Vector2(0,0)
	if deplacement == "Verticale":
		velocity.y += 1
		
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

