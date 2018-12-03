extends Control

onready var tie = $MainContainer/tie
onready var choiceLabel = $MainContainer/DialogueContainer/Choice
onready var choice1Button = $MainContainer/DialogueContainer/ChoiceButtonsContainer/Choice1
onready var choice2Button = $MainContainer/DialogueContainer/ChoiceButtonsContainer/Choice2
onready var choice3Button = $MainContainer/DialogueContainer/ChoiceButtonsContainer2/Choice3
onready var choice4Button = $MainContainer/DialogueContainer/ChoiceButtonsContainer2/Choice4

var state = 0

func _ready():
	tie.connect("input_enter", self, "_on_input_enter")
	tie.connect("buff_end", self, "_on_buff_end")
	tie.connect("state_change", self, "_on_state_change")
	tie.connect("enter_break", self, "_on_enter_break")
	tie.connect("resume_break", self, "_on_resume_break")
	tie.connect("tag_buff", self, "_on_tag_buff")

	tie.buff_text("You arrive to a dinner\n", 0.03)
	tie.buff_silence(0.5)
	tie.buff_text("A big robot with red eyes asks you to give him your bike and clothes\n", 0.03)
	tie.buff_silence(0.5)
	tie.buff_text("What do you do ?\n\n\n\n")
	tie.buff_silence(0.5)
	tie.buff_text("1 : You beat his ass\n")
	tie.buff_silence(0.5)
	tie.buff_text("2 : You don't have a bike\n")
	tie.buff_silence(0.5)
	tie.buff_text("3 : You help him to rob someone else\n")
	tie.buff_silence(0.5)
	tie.buff_text("4 (Gambler) : You bet your clothes on a dice game\n ")
	tie.buff_silence(0.5)
	tie.set_state(tie.STATE_OUTPUT)

	
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _on_input_enter(s):
	print("Input Enter ", s)
	pass

func _on_buff_end():
	if state == 0:
		
		choiceLabel.text = "Your choice ?"
		choice1Button.text = "1"
		choice2Button.text = "2"
		choice3Button.text = "3"
		choice4Button.text = "4"
		choiceLabel.visible = true
		choice1Button.visible = true
		choice2Button.visible = true
		choice3Button.visible = true
		choice4Button.visible = true
		choice4Button.disabled = true
		for i in range (0, playerData.crew_size):
			for j in playerData.crew[i].trait:
				if j == "Gambler":
					choice4Button.disabled = false
					
	if state == 1:
		choice1Button.text = "Next"
		choice1Button.visible = true
		
	state += 1

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
	if state < 2:
		tie.buff_clear()
		tie.buff_text("After beating his ass, you sell his body.\n", 0.03)
		tie.buff_text("You earn 50 Neon.\n", 0.03)
		playerData.neonLeft += 50
		tie.set_state(tie.STATE_OUTPUT)
		choiceLabel.visible = false
		choice1Button.visible = false
		choice2Button.visible = false
		choice3Button.visible = false
		choice4Button.visible = false
	
	if state == 2:
		get_tree().change_scene("res://gestion/ManagementScreen/EventScreen/Event11/Event11.tscn")


func _on_Choice2_pressed():
	tie.buff_clear()
	tie.buff_text("He says ok and then walk away.\n", 0.03)
	tie.buff_text("Nothing happens.\n", 0.03)
	tie.set_state(tie.STATE_OUTPUT)
	choiceLabel.visible = false
	choice1Button.visible = false
	choice2Button.visible = false
	choice3Button.visible = false
	choice4Button.visible = false


func _on_Choice3_pressed():
	tie.buff_clear()
	tie.buff_text("He thinks you're really nice\n", 0.03)
	tie.buff_silence(0.5)
	tie.buff_text("He says : Asta la Vista babe and then joins your crew\n", 0.03)
	if playerData.crew_size == 5:
		playerData.crew[playerData.crew_size-1] = characterManagement.randomize_new_character()
		tie.buff_text("Your crew is full, the big robot takes the place of one of your mate.\n", 0.03)
	else:
		playerData.crew[playerData.crew_size] = characterManagement.randomize_new_character()
	tie.set_state(tie.STATE_OUTPUT)
	choiceLabel.visible = false
	choice1Button.visible = false
	choice2Button.visible = false
	choice3Button.visible = false
	choice4Button.visible = false


func _on_Choice4_pressed():
	tie.buff_clear()
	tie.buff_text("You always do this you greedy bastard\n", 0.03)
	tie.buff_silence(0.5)
	tie.buff_text("Of course you lost\n", 0.03)	
	tie.buff_silence(0.5)
	tie.buff_text("But someone thought you were a stripper and gave you 50 Neon\n", 0.03)
	tie.buff_silence(0.5)
	playerData.neonLeft += 50
	tie.set_state(tie.STATE_OUTPUT)
	choiceLabel.visible = false
	choice1Button.visible = false
	choice2Button.visible = false
	choice3Button.visible = false
	choice4Button.visible = false