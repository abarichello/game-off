extends Node2D

var current_color: Color = GLOBAL.HIGHLIGHT

func _ready():
	self.update_color()

func update_color() -> void:
	self.modulate = self.current_color

func swap_color() -> void:
	if current_color == GLOBAL.LOWLIGHT:
		current_color = GLOBAL.HIGHLIGHT
	else:
		current_color = GLOBAL.LOWLIGHT
	self.update_color()

func set_random_color() -> void:
	randomize()
	if randi() % 2 == 0:
		self.swap_color()
		self.update_color()
