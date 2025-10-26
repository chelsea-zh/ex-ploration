class_name PauseMenu extends Control

@onready var menuOpen = false
@onready var menu: Node = $CanvasLayer/menu

signal restart

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	return_to_game()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_pause_pressed() -> void:
	menuOpen = !menuOpen
	menu.visible = menuOpen
	get_tree().paused = menuOpen
	pass # Replace with function body.

func return_to_game():
	menuOpen = false
	menu.visible = false
	get_tree().paused = false

func _on_continue_pressed() -> void:
	return_to_game()
	pass # Replace with function body.

func _on_restart_pressed() -> void:
	return_to_game()
	restart.emit()
	pass # Replace with function body.

func _on_exit_pressed() -> void:
	return_to_game()
	get_tree().change_scene_to_file.call_deferred("res://scenes/level_screen.tscn")
	pass # Replace with function body.
