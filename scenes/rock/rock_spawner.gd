extends Node
class_name RockSpawner

@export var rock_scene: PackedScene
@export var number_of_rocks := 2

var rocks: int

func _ready() -> void:
	pass

func _on_connection_requested(ground: Ground) -> void:
	ground.request_rock.connect(_on_ground_request_rock)

func _on_ground_request_rock(ground: Ground) -> void:
	print("ground.position.x seen by spawner = ", ground.position.x)
	for i in range(number_of_rocks):
		var spawn_point = ground.rock_spawn_points[i]
		var rock := rock_scene.instantiate()
		rock.global_position = spawn_point.global_position
		print(spawn_point.global_position)
		rock.speed = ground.speed
		rock.despawn.connect(_on_rock_despawn)
		add_child.call_deferred(rock)
		rocks += 1
		
func _on_rock_despawn(rock: Rock) -> void:
	rocks -= 1
	rock.queue_free()
