extends CanvasLayer

var path = "res://life.png"
var score = 0

func set_health(amount):
	for child in $MarginContainer2/HBoxContainer.get_children():
		child.queue_free()
	for i in amount:
		var text_rect = TextureRect.new()
		text_rect.texture = load(path)
		$MarginContainer2/HBoxContainer.add_child(text_rect)
		text_rect.expand_mode = TextureRect.EXPAND_FIT_WIDTH
		


func _on_score_timer_timeout() -> void:
	score+=10
	$MarginContainer/Label.text = str(score)
	Global.score = score
