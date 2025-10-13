extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	#connects each level selector's signal to change scenes
	for child in $levels.get_children():
		var level_path = "levels/"
		level_path += child.name
		var level = get_node(level_path) as LevelSelector
		level.chosen.connect(go_to_level)
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#changes scene to chosen level if unlocked
func go_to_level(levelName: String):
	var level_path = "levels/" + levelName
	var level = get_node(level_path) as LevelSelector
	#if unlocked
	if level.levelIndex >= Global.currentLevel:
		get_tree().change_scene_to_file.call_deferred("res://scenes/levels/" + name + ".tscn")
	else: #if locked
		$level_locked.visible = true
		var timer = Timer.new()
		add_child(timer)
		timer.wait_time = .5
		timer.one_shot = true
		timer.timeout.connect()
		timer.start()
		#TODO: fade transition? changing size? wobbling? idk :sob:

func display_locked():
	$level_locked.visible = false
