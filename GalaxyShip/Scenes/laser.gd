extends Area2D

@export var speed = 350
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _ready() -> void:
	var tween = create_tween()
	tween.tween_property($Sprite2D,'scale',Vector2(0.35,0.35),0.5).from(Vector2(0,0))

func _process(delta: float) -> void:
	position.y -= speed * delta
