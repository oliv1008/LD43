extends Control

onready var Portrait = $MainContainer/IdentityContainer/Portrait
onready var NameLabel = $MainContainer/IdentityContainer/Name
onready var LevelLabel = $MainContainer/Level
onready var AttaqueLabel = $MainContainer/Attaque
onready var CompetenceLabel = $MainContainer/Competence
onready var TraitArray = [$MainContainer/TraitCaractereContainer/VBoxContainer/Trait1, \
						$MainContainer/TraitCaractereContainer/VBoxContainer/Trait2, \
						$MainContainer/TraitCaractereContainer/VBoxContainer/Trait3]
onready var QuoteLabel = $Quote

func _ready():
	var background = ColorRect.new()
	var background_gris = ColorRect.new()
	background_gris.color = Color(0, 0, 0, 0.3)
	background.color = Color(0, 0, 0, 1)
	background.rect_size = $MainContainer.rect_size + Vector2(10, 10)
	background.rect_position = $MainContainer.rect_position - Vector2(10, 10)
	background_gris.rect_size = Vector2(2000, 2000)
	background_gris.rect_position = Vector2(-500, -500)
	add_child(background)
	move_child(background, 0)
	add_child(background_gris)
	move_child(background_gris, 0)
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func init(robot):
	Portrait.texture = robot.portrait
	NameLabel.text = robot.robot_name
	LevelLabel.text = str("Level : ", robot.level)
	AttaqueLabel.text = str("Damage : ", robot.base_attaque_value * robot.damageModifier)
	CompetenceLabel.text = str("Skill : ", robot.competence, " (", robot.competenceDescription, ")")
	for i in range(0, robot.trait.size()):
		TraitArray[i].visible = true
		TraitArray[i].text = robot.trait[i]
	QuoteLabel.text = robot.quote
	
func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().set_input_as_handled() 
		queue_free()
	
	