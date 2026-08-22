extends CanvasLayer
class_name HUD

@onready var number_container: NumberContainer = %NumberContainer

func update_score(score: int) -> void:
	number_container.update_score(score)
