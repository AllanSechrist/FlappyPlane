extends Node2D
class_name GameManager

@onready var player: Player = $Player
@onready var rock_spawner: RockSpawner = $RockSpawner
@onready var ground_spawner: GroundSpawner = $GroundSpawner
@onready var collectable_spawner: CollectableSpawner = $CollectableSpawner



var score := 0

#UI
signal score_changed(new_score: int)

func _ready() -> void:
	ground_spawner.request_connection.connect(rock_spawner._on_connection_requested)
	collectable_spawner.collectable_collected.connect(_on_score_change)

func _on_score_change(points: int) -> void:
	score += points
	score_changed.emit(score)
	increase_game_speed()
	print(score)
	
func increase_game_speed() -> void:
	GameSettings.game_speed *= 1.0025
	GameSettings.top_rock_offset += 0.5
	print(GameSettings.game_speed)
	print(GameSettings.top_rock_offset)
