class_name PauseMenu extends Control

@onready var menuOpen = false
@onready var menu: Node = $CanvasLayer/menu

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	menu.visible = false
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_pause_pressed() -> void:
	menuOpen = !menuOpen
	menu.visible = menuOpen
	get_tree().paused = menuOpen
	pass # Replace with function body.
