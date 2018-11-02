extends Node2D

onready var EnemyScene: PackedScene = preload("res://scenes/Projectile.tscn")

var Enemy

func _ready():
	pass

func setup_enemy() -> void:
	self.Enemy = EnemyScene.new()
	Enemy.setup(GLOBAL.MISSILE, GLOBAL.MISSILE_SPEED["max"])
