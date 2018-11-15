extends "res://scripts/ColoredEntity.gd"

func _ready():
	self.highlight()

func _input(event):
	if Input.is_action_just_pressed("swap"):
		GLOBAL.swap_nodes_color()
	if Input.is_action_pressed("fire"):
		self.shoot_bullet()

func shoot_bullet() -> void:
	$Cannon.shoot()
