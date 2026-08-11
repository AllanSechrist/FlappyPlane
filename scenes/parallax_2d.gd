extends Parallax2D

@onready var background: Sprite2D = $Background

func _ready() -> void:
	background.centered = false
	background.position = Vector2.ZERO
	
	var viewport_size := get_viewport_rect().size
	var tex_size := background.texture.get_size()
	
	var scale_factor := viewport_size.y / tex_size.y
	background.scale = Vector2(scale_factor, scale_factor)
	
	var scaled_width := tex_size.x * scale_factor
	repeat_size = Vector2(scaled_width, 0)
	repeat_times = int(ceil(viewport_size.x / scaled_width)) + 2
	
	autoscroll = Vector2(-60, 0)
