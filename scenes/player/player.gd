extends CharacterBody2D
class_name Player

@onready var sprite_2d: Sprite2D = $Sprite2D

@export var gravity := 900.0
@export var click_strength := 500.0
# Animation
@export var rotate_speed := 5.0
@export var max_up_degrees := -30.0
@export var max_down_degrees := 90.0
@export var max_fall_speed := 600.0 # When fully tilted down

var alive := true

signal die

func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
	
	if Input.is_action_just_pressed("click") and alive:
		velocity.y = -click_strength
	
	move_and_slide()
	
	if get_slide_collision_count() > 0:
		die.emit()
		
	_update_sprite_rotation(delta)
	
func _update_sprite_rotation(delta: float) -> void:
	var target_degrees: float
	if velocity.y < 0:
		target_degrees = max_up_degrees
	else:
		var t = clamp(velocity.y / max_fall_speed, 0.0, 1.0)
		target_degrees = lerp(0.0, max_down_degrees, t)
		
	sprite_2d.rotation_degrees = lerp(sprite_2d.rotation_degrees, target_degrees, rotate_speed * delta)
