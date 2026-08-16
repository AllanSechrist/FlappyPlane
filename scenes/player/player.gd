extends CharacterBody2D
class_name Player

@export var gravity := 900.0
@export var click_strength := 500.0

func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
	
	if Input.is_action_just_pressed("click"):
		velocity.y = -click_strength
	
	move_and_slide()
	
	if get_slide_collision_count() > 0:
		game_over()
		
func game_over() -> void:
	print("Game Over!")
	queue_free()
