class_name Dialogue extends Label

# this game requires very simple dialogue
# so i am making a very simple
# and lowkey inefficient dialogue system
# pls don't judge me
# :bow:

var level : String

var dialogueId : int = 0

var dialogue = {
	"level_base": [
		"hello",
		"testing",
		"the quick brown fox jumps over the lazy dog"
	]
}

@onready var valid = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if dialogue.size() == 0:
		valid = false
		
		
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func next():
	visible = true
	# if it is currently the last dialogue
	if dialogue[level].size() == dialogueId:
		visible = false
		valid = false
	else:
		var memberName = get_script().resource_path.get_basename().get_file()
		text = memberName + ": \n" + dialogue[level][dialogueId]
		dialogueId += 1
	pass
