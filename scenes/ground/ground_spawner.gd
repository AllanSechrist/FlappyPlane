extends Node
class_name GroundSpawner

@export var ground_scene: PackedScene
@export var starting_ground_segments := 3
@export var ground_segments: Array[Ground]

var respawn_point := Vector2(1512.0, 615.0)

signal request_connection(ground: Ground)

func _ready() -> void:
	for segment in ground_segments:
		segment.despawn.connect(_on_despawn)


func spawn_ground() -> void:
	var ground = ground_scene.instantiate()
	ground.global_position = respawn_point
	ground.despawn.connect(_on_despawn)
	add_child.call_deferred(ground)
	request_connection.emit(ground)
	ground_segments.append(ground)
	
func _on_despawn(ground: Ground) -> void:
	ground_segments.erase(ground)
	ground.queue_free()
	spawn_ground()
