extends KinematicBody2D

export (int) var speed
var screensize


func _on_hit():
	playerData.carHP -= 1
	if playerData.carHP == 0:
		$"../TimerProjec".stop()
		get_tree().change_scene("res://gestion/ManagementScreen/GameOver/GameOver.tscn")
		MusicPlayer.brutalPlaySong("GameOverTheme")
	#Lorsqu'un projectile rencontre le player, on baisse la vie etc
	
func _ready():
	screensize = get_viewport_rect().size
	playerData.playerRef = self

func _physics_process(delta):
	var velocity = Vector2()
	if Input.is_action_pressed("right") and Input.is_action_pressed("down"):
		velocity.x += 1
		velocity.y += 1
	elif Input.is_action_pressed("left") and Input.is_action_pressed("down"):
		velocity.x -= 1
		velocity.y += 1
	elif Input.is_action_pressed("right") and Input.is_action_pressed("up"):
		velocity.x += 1
		velocity.y -= 1
	elif Input.is_action_pressed("left") and Input.is_action_pressed("up"):
		velocity.x -= 1
		velocity.y -= 1 
	elif Input.is_action_pressed("left") and Input.is_action_pressed("right"):
		velocity.x += 0
		velocity.y += 0
	elif Input.is_action_pressed("down") and Input.is_action_pressed("up"):
		velocity.x += 0
		velocity.y += 0
	elif Input.is_action_pressed("right"):
		velocity.x += 1
	elif Input.is_action_pressed("left"):
		velocity.x -= 1
	elif Input.is_action_pressed("down"):
		velocity.y += 1
	elif Input.is_action_pressed("up"):
		velocity.y -= 1

	if velocity.length() > 0:
		if Input.is_action_pressed("slow") and playerData.carParts["clutch"] == true:
			velocity = velocity.normalized() * speed * 0.5 * delta
		else:
			velocity = velocity.normalized() * speed * delta
		move_and_collide(velocity)

		if playerData.carParts["left_wheel"] == false:
			if velocity.x < 0:
				velocity.x = float(velocity.x/10)
		if playerData.carParts["right_wheel"] == false:
			if velocity.x > 0:
				velocity.x = float(velocity.x/10)
		if playerData.carParts["engine"] == false:
			if velocity.y < 0:
				velocity.y = float(velocity.y/10)
		if playerData.carParts["brake"] == false:
			if velocity.y > 0:
				velocity.y = float(velocity.y/10)

		position += velocity
		position.x = clamp(position.x, 0, screensize.x)
		position.y = clamp(position.y, 0, screensize.y-120)





