extends Node2D
class_name GameManager

@onready var player: Player = $Player
@onready var rock_spawner: RockSpawner = $RockSpawner
@onready var ground_spawner: GroundSpawner = $GroundSpawner
@onready var collectable_spawner: CollectableSpawner = $CollectableSpawner
@onready var parallax_2d: Parallax2D = $Parallax2D
@onready var hud: HUD = $HUD

var score := 0

func _ready() -> void:
	ground_spawner.request_connection.connect(rock_spawner._on_connection_requested)
	collectable_spawner.collectable_collected.connect(_on_score_change)
	player.die.connect(game_over)

func _on_score_change(points: int) -> void:
	score += points
	increase_game_speed()
	hud.update_score(score)
	
func increase_game_speed() -> void:
	GameSettings.game_speed *= 1.0025
	GameSettings.top_rock_offset += 0.5

func stop_game():
	collectable_spawner.spawn_timer.stop()
	var tween = create_tween()
	tween.set_parallel(true)
	
	tween.tween_property(GameSettings, "game_speed", 0.0, 1.0).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_OUT)
	tween.tween_property(parallax_2d, "autoscroll", Vector2.ZERO, 1.0).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_OUT)

func game_over() -> void:
	player.alive = false
	stop_game()
	
	
	
