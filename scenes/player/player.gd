extends CharacterBody2D
class_name Player

@export var gravity := 900.0
@export var click_strength := 500.0

var alive := true

signal die


func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
	
	if Input.is_action_just_pressed("click") and alive:
		velocity.y = -click_strength
	
	move_and_slide()
	
	if get_slide_collision_count() > 0:
		die.emit()
