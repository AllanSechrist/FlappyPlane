extends Node2D
class_name RockSpawner

@export var rock_scene: PackedScene
@export var number_of_rocks := 2
@export var rock_distance := 450.0

var rocks: int

func _ready() -> void:
	pass

func _on_connection_requested(ground: Ground) -> void:
	ground.request_rock.connect(_on_ground_request_rock)

func _on_ground_request_rock(ground: Ground) -> void:
	print("ground.position.x seen by spawner = ", ground.position.x)
	var screen_size := get_viewport_rect().size
	for i in range(number_of_rocks):
		var spawn_point = ground.rock_spawn_points[i]
		var rock_bottom := rock_scene.instantiate()
		var rock_top := rock_scene.instantiate()
		rock_bottom.global_position = spawn_point.global_position
		rock_bottom.speed = ground.speed
		rock_bottom.despawn.connect(_on_rock_despawn)
		
		rock_top.rotation_degrees = 180.0
		rock_top.global_position = Vector2(spawn_point.global_position.x + rock_distance, 0)
		rock_top.speed = ground.speed
		rock_top.despawn.connect(_on_rock_despawn)
		add_child.call_deferred(rock_bottom)
		add_child.call_deferred(rock_top)
		rocks += 2
		
func _on_rock_despawn(rock: Rock) -> void:
	rocks -= 1
	rock.queue_free()
