class_name Dialogue extends Label

# this game requires very simple dialogue
# so i am making a very simple
# and lowkey inefficient dialogue system
# pls don't judge me
# :bow:

var level : String

var id : int

var dialogue = {
	
}

@onready var valid = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func next():
	visible = true
	if dialogue[level].length - 1 == id:
		visible = false
		valid = false
	else:
		text = dialogue[level][id]
	pass
