extends Node2D

var current_color: Color

func _ready():
	pass

func update_color() -> void:
	self.modulate = self.current_color

func swap_color() -> void:
	if current_color == GLOBAL.LOWLIGHT:
		self.highlight()
	else:
		self.lowlight()

func highlight():
	current_color = GLOBAL.HIGHLIGHT
	self.update_color()

func lowlight():
	current_color = GLOBAL.LOWLIGHT
	self.update_color()

func set_random_color() -> void:
	randomize()
	if randi() % 2 == 0:
		self.swap_color()
