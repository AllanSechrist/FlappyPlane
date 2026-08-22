extends Node2D
class_name GameManager

@onready var player: Player = $Player
@onready var rock_spawner: RockSpawner = $RockSpawner
@onready var ground_spawner: GroundSpawner = $GroundSpawner
@onready var collectable_spawner: CollectableSpawner = $CollectableSpawner
@onready var hud: HUD = $HUD

var score := 0

func _ready() -> void:
	ground_spawner.request_connection.connect(rock_spawner._on_connection_requested)
	collectable_spawner.collectable_collected.connect(_on_score_change)

func _on_score_change(points: int) -> void:
	score += points
	increase_game_speed()
	hud.update_score(score)
	
func increase_game_speed() -> void:
	GameSettings.game_speed *= 1.0025
	GameSettings.top_rock_offset += 0.5
	print(GameSettings.game_speed)
	print(GameSettings.top_rock_offset)
