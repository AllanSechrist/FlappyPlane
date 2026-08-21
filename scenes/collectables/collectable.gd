extends Area2D
class_name Collectable

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

@export var speed := 150.0

signal collected
signal despawn

func _ready() -> void:
	pass
	
func _physics_process(delta: float) -> void:
	position.x -= speed * delta
	
	if position.x <= -50:
		despawn.emit()
		queue_free()
		
func _on_body_entered(_body: Node2D) -> void:
	monitoring = false
	collected.emit()
	queue_free()
