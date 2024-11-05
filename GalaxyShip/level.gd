extends Node2D

var meteor_scene:PackedScene = load("res://Scenes/meteor.tscn")
var laser_scene:PackedScene = load("res://Scenes/laser.tscn")
var rnd = RandomNumberGenerator.new()
var health:int = 3

func _ready() -> void:
	get_tree().call_group('ui','set_health',health)
	for star in $Stars.get_children():
		var rand_x = rnd.randi_range(0,1280)
		var rand_y = rnd.randi_range(0,720)
		var random_scale = rnd.randf_range(0.2,0.6)
		var random_speed = rnd.randf_range(0.3,1.2)
		star.position = Vector2(rand_x,rand_y)
		star.scale = Vector2(random_scale,random_scale)
		star.speed_scale = random_speed
	
func _on_meteor_timer_timeout() -> void:
	var meteor = meteor_scene.instantiate()
	$Meteores.add_child(meteor)
	meteor.connect('collison',_on_meteor_collison)

func _on_meteor_collison():
	health-=1
	get_tree().call_group('ui','set_health',health)
	if health<=0:
		get_tree().call_deferred("change_scene_to_file", "res://Scenes/game_over.tscn")

func _on_player_laser(pos) -> void:
	var laser = laser_scene.instantiate()
	$Lasers.add_child(laser)
	laser.position = pos
