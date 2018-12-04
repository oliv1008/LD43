extends KinematicBody2D

var health = 300

export (int) var speed
export (String) var deplacement
var spawnPosition = Vector2()
var velocity = Vector2()
var nombreDeMort = 0


func _ready():
	position = spawnPosition
		
func _physics_process(delta):
	velocity = Vector2()
	velocity.y += 1
	velocity = velocity.normalized() * speed * delta
	position += velocity
	

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