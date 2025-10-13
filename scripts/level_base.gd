class_name LevelBase extends Node2D

@onready var player: CharacterBody2D = $player
@onready var currentCheckpoint: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	on_spawn()
	
	for i in range($checkpoints.get_child_count()):
		var checkpoint_path = "checkpoints/"
		checkpoint_path += str(i)
		var checkpoint = get_node(checkpoint_path) as Checkpoint
		checkpoint.checkpointReached.connect(change_current_checkpoint)
		
	$killzone.enteredKillzone.connect(on_spawn)
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func on_spawn():
	#spawnpoint is named 0
	var checkpoint_path = "checkpoints/"
	checkpoint_path += str(currentCheckpoint)
	var checkpoint = get_node(checkpoint_path) as Checkpoint
	player.global_position = checkpoint.global_position
	
	pass

func change_current_checkpoint(checkpoint: int):
	if checkpoint > currentCheckpoint:
		currentCheckpoint = checkpoint
