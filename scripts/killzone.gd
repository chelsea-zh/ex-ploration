class_name Killzone extends Area2D

@onready var timer: Timer = $Timer

signal enteredKillzone

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	#TODO: make game pause when entering killzone
	if body is Player:
		timer.start()
	pass # Replace with function body.

func _on_timer_timeout() -> void:
	enteredKillzone.emit()
	pass # Replace with function body.
