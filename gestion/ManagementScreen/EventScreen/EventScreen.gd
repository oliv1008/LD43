extends Control

onready var tie = $MainContainer/tie
onready var choiceLabel = $MainContainer/DialogueContainer/Choice
onready var choice1Button = $MainContainer/DialogueContainer/ChoiceButtonsContainer/Choice1
onready var choice2Button = $MainContainer/DialogueContainer/ChoiceButtonsContainer/Choice2
onready var choice3Button = $MainContainer/DialogueContainer/ChoiceButtonsContainer2/Choice3
onready var choice4Button = $MainContainer/DialogueContainer/ChoiceButtonsContainer2/Choice4

func _ready():
	tie.connect("input_enter", self, "_on_input_enter")
	tie.connect("buff_end", self, "_on_buff_end")
	tie.connect("state_change", self, "_on_state_change")
	tie.connect("enter_break", self, "_on_enter_break")
	tie.connect("resume_break", self, "_on_resume_break")
	tie.connect("tag_buff", self, "_on_tag_buff")

	tie.buff_text("Ceci est un test\nCeci est un autre test", 0.1)
	tie.buff_silence(1)
	tie.buff_text("\n\nCeci est toujours un test")
	tie.set_state(tie.STATE_OUTPUT)
	
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _on_input_enter(s):
	print("Input Enter ", s)
	pass

func _on_buff_end():
	choiceLabel.text = "Votre choix ?"
	choice1Button.text = "Choix 1"
	choice2Button.text = "Choix 2"
	choiceLabel.visible = true
	choice1Button.visible = true
	choice2Button.visible = true

func _on_state_change(i):
	print("New state: ", i)
	pass

func _on_enter_break():
	print("Enter Break")
	pass

func _on_resume_break():
	print("Resume Break")
	pass

func _on_tag_buff(s):
	print("Tag Buff ", s)
	pass

func _on_Choice1_pressed():
	pass # replace with function body


func _on_Choice2_pressed():
	pass # replace with function body


func _on_Choice3_pressed():
	pass # replace with function body


func _on_Choice4_pressed():
	pass # replace with function body
