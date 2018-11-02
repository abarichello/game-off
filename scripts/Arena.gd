extends Control

func _ready():
	self.setup_arena()

func setup_arena() -> void:
	$Background.lowlight()
