extends Control

func _ready() -> void:
	$CenterContainer/VBoxContainer/Label2.text += str(Global.score)

var level_scene:PackedScene = load('res://Scenes/level.tscn')
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot"):
		get_tree().change_scene_to_packed(level_scene)
