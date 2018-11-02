extends "res://scripts/ColoredEntity.gd"

var target: Vector2

func _ready():
	self.set_random_color()

func _process(delta):
	pass

func shoot(target: Vector2) -> void:
	self.target = target
