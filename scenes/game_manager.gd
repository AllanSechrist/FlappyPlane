extends Node2D
class_name GameManager

@onready var player: Player = $Player
@onready var rock_spawner: RockSpawner = $RockSpawner
@onready var ground_spawner: GroundSpawner = $GroundSpawner


func _ready() -> void:
	ground_spawner.request_connection.connect(rock_spawner._on_connection_requested)
