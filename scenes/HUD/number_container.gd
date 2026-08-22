extends HBoxContainer
class_name NumberContainer

@export var digit_textures: Array[Texture2D] = []

func _ready() -> void:
	alignment = BoxContainer.ALIGNMENT_CENTER
	update_score(0)

func update_score(score: int) -> void:
	for child in get_children():
		remove_child(child)
		child.queue_free()
		
	for digit_char in str(score):
		var digit := int(digit_char)
		var tex_rect := TextureRect.new()
		tex_rect.texture = digit_textures[digit]
		tex_rect.stretch_mode = TextureRect.STRETCH_KEEP
		add_child(tex_rect)
