extends AnimatableBody2D
class_name Rock

@export var speed := 150.0

var despawn_x: float
var respawn_x: float

func _ready() -> void:
	var screen_size := get_viewport_rect().size
	despawn_x = -100.0
	respawn_x = screen_size.x + 100.0
	
func _physics_process(delta: float) -> void:
	position.x -= speed * delta
	
	if position.x < despawn_x:
		position.x = respawn_x
