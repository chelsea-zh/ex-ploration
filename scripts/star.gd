extends AnimatedSprite2D

var up : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Timer.wait_time = float(randi() % 20) * 0.5 + .5
	$Timer.start()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	if up:
		position.y -= 2
		up = !up
	else:
		position.y += 2
		up = !up
	
	$Timer.wait_time = randi() % 20 * .5 + .5
	$Timer.start()
	pass # Replace with function body.
