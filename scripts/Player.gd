extends "res://scripts/ColoredEntity.gd"

func _ready():
	self.highlight()

func _input(event):
	if Input.is_action_just_pressed("swap"):
		self.swap_nodes_color()
	if Input.is_action_pressed("fire"):
		self.shoot_bullet()

func swap_nodes_color() -> void:
	var nodes: Array = self.get_tree().get_nodes_in_group("ColoredEntity")
	for node in nodes:
		node.swap_color()

func shoot_bullet() -> void:
	$Cannon.shoot()
