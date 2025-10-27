class_name LevelSelector extends Button

@export var levelIndex: int
@export var levelName: String
signal chosen(level: String)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Label.text = levelName
	text = str(levelIndex)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_button_pressed() -> void:
	chosen.emit(name)
	pass # Replace with function body.
