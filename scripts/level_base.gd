class_name LevelBase extends Node2D

@onready var player: CharacterBody2D = $player
@onready var currentCheckpoint: int = 0
@onready var completed = false

@export var levelIndex: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	on_spawn()
	
	for i in range($checkpoints.get_child_count()):
		var checkpoint_path = "checkpoints/"
		checkpoint_path += str(i)
		var checkpoint = get_node(checkpoint_path) as Checkpoint
		checkpoint.checkpointReached.connect(change_current_checkpoint)
		if (i == $checkpoints.get_child_count() - 1):
			checkpoint.visible = false
		
	$killzone.enteredKillzone.connect(on_spawn)
	$killzone.stopInput.connect(deathAnimation)
	$pauseMenu.restart.connect(restart)
	
	for child in get_children():
		if child is Member:
			child.level = name
	
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
	
	Global.acceptInput = true
	$player/AnimatedSprite2D.animation = "default"
	
	pass

func change_current_checkpoint(checkpoint: int):
	if checkpoint > currentCheckpoint:
		currentCheckpoint = checkpoint
		
	#if reached last checkpoint / finished level
	if checkpoint == $checkpoints.get_child_count() - 1:
		completed = true
		#if level is highest completed level
		if levelIndex >= Global.currentLevel:
			Global.currentLevel = levelIndex + 1
			
		Global.acceptInput = false
		var timer = Timer.new()
		add_child(timer)
		timer.one_shot = true
		timer.wait_time = 1
		timer.timeout.connect(finish)
		timer.start()
		
func deathAnimation():
	#$player/AnimatedSprite2D.play("death")
	pass
	
func restart():
	currentCheckpoint = 0
	on_spawn()
	
	#TODO: pause game when finished level -> think mario?
		#bc i don't want to do a thing where you press space at the end :sob:
		#then i have to make a new class for finish
	# add a screen that says it's done? like text on screen
	# start timer .5s set paused to true
	# or some way that user input no longer matters ... that would be better actually
	#find a way to make user input no longer matter -> use for killzone as well
	# start timer 2s or smth switch scene to level_selector
	# alternatively have a menu for restart or level_selector
	# same as pause menu

func finish():
	get_tree().change_scene_to_file.call_deferred("res://scenes/level_screen.tscn")
