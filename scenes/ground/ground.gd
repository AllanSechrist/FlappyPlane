extends AnimatableBody2D
class_name Ground

@onready var spawn_points: Node2D = $SpawnPoints

@export var ground_width := 808.0
@export var piece_count := 3

var rock_spawn_points: Array[Marker2D]

signal despawn(ground: Ground)
signal request_rock(spawn_point: Marker2D)

func _ready() -> void:
	for child in spawn_points.get_children():
		if child is Marker2D:
			rock_spawn_points.append(child)
	request_rock.emit(self)

func _physics_process(delta: float) -> void:
	position.x -= GameSettings.game_speed * delta
	
	if position.x <= -ground_width:
		despawn.emit(self)

func get_random_spawn_point() -> Marker2D:
	if rock_spawn_points.is_empty():
		return null
	return rock_spawn_points.pick_random()
