extends AnimatableBody2D
class_name Rock

@export var speed := 150.0

var despawn_x: float
var has_despawned := false

signal despawn(Rock)

func _ready() -> void:
	despawn_x = -100.0
	
func _physics_process(delta: float) -> void:
	position.x -= speed * delta
	
	if position.x < despawn_x and not has_despawned:
		has_despawned = true
		despawn.emit(self)
