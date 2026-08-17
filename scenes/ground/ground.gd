extends AnimatableBody2D
class_name Ground

@export var speed := 150.0
@export var ground_width := 808.0
@export var piece_count := 3

func _physics_process(delta: float) -> void:
	position.x -= speed * delta
	
	if position.x <= -ground_width:
		position.x += ground_width * piece_count
	
