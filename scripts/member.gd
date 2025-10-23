class_name Member extends Area2D

@export var memberName : String
var inRange : bool = false
var level : String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$dialogue.id = 0
	if level == "siren":
		$dialogue.text = "Press \"f\" to interact."
	else:
		$dialogue.visible = false
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if inRange and Input.is_action_just_pressed("interact") and $dialogue.valid:
		$dialogue.level = level
		$dialogue.next()
		pass

#TODO: when in range + press spaace? hmmm maybe i for interact ig
# do function from dialogue with name as manager
# dialogue script reads from txt file w/ member name as member.txt?
# .. is there any way to use a gd script file instead? :sob:
# txt file im too my cs class fileio pilled
#bro genuinely what kind of file should i use :sob:
# set up like
#list of
# level = siren
# script -> if level == siren, id = 0, etc etc

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		inRange = true
	pass # Replace with function body.

func _on_body_exited(body: Node2D) -> void:
	if body is Player:
		inRange = false
	pass # Replace with function body.
