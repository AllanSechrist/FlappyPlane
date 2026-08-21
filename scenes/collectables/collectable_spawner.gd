extends Node2D
class_name CollectableSpawner

@onready var spawn_timer: Timer = $SpawnTimer
@onready var spawn_point: Marker2D = $SpawnPoint

@export var colletable_scene: PackedScene
@export var spawn_interval := 4.0

signal collectable_collected(points: int)

func _ready() -> void:
	spawn_timer.timeout.connect(_on_spawn_timer_timeout)
	spawn_timer.start(spawn_interval)
	spawn()
	
func _on_spawn_timer_timeout() -> void:
	spawn()
	
func spawn() -> void:
	var collectable := colletable_scene.instantiate()
	collectable.global_position = spawn_point.global_position
	collectable.collected.connect(_on_collected)
	add_child.call_deferred(collectable)
	
func _on_collected(collectable: Collectable) -> void:
	collectable_collected.emit(collectable.score)
