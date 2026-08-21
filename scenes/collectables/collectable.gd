extends Area2D
class_name Collectable

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

@export var score := 1

signal collected(collectable: Collectable)
signal despawn

func _ready() -> void:
	pass
	
func _physics_process(delta: float) -> void:
	position.x -= GameSettings.game_speed * delta
	
	if position.x <= -50:
		despawn.emit()
		queue_free()
		
func _on_body_entered(_body: Node2D) -> void:
	set_deferred("monitoring", false) 
	collected.emit(self)
	queue_free()
