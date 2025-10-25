class_name Member extends Area2D

@export var memberName : String
var inRange : bool = false
var level : String

@onready var dialogue = $dialogue as Dialogue

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	dialogue.set_script(load("res://scripts/" + memberName + ".gd"))
	dialogue._ready()
	
	dialogue.dialogueId = 0
		
	changeFrame()
	
	# for jongseob's bun ... i should have just added 2 more pixels to each sprite
	# but u can't move by folder in resprite ... whyyyyyyyyyyy :sob:
	if $AnimatedSprite2D.frame == 6:
		$AnimatedSprite2D.position.y = -2
	else:
		$AnimatedSprite2D.position.y = 0
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if inRange and Input.is_action_just_pressed("interact") and dialogue.valid:
		dialogue.level = level
		dialogue.next()
	

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		inRange = true
	
	pass # Replace with function body.

func _on_body_exited(body: Node2D) -> void:
	if body is Player:
		inRange = false
	pass # Replace with function body.

func changeFrame():
	
	match memberName:
		"soul":
			$AnimatedSprite2D.frame = 1
		"jiung":
			$AnimatedSprite2D.frame = 2
		"theo":
			$AnimatedSprite2D.frame = 3
		"intak":
			$AnimatedSprite2D.frame = 4
		"keeho":
			$AnimatedSprite2D.frame = 5
		"jongseob":
			$AnimatedSprite2D.frame = 6
	
	pass
	
func setLevelName(name):
	level = name
	if level == "siren":
		dialogue.visible = true
		dialogue.text = "Press \"f\" to interact."
	else:
		dialogue.visible = false
