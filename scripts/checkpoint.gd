class_name Checkpoint extends Node2D

signal checkpointReached(checkpoint: int)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.frame = 0
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		checkpointReached.emit(int(name))
		$AnimatedSprite2D.frame = 1
	pass # Replace with function body.

func restartTexture():
	$AnimatedSprite2D.frame = 0
