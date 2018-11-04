extends Node2D

onready var EnemyScene: PackedScene = preload("res://scenes/Projectile.tscn")

var Enemy

func _ready():
	self.setup_enemy()

func setup_enemy() -> void:
	self.Enemy = EnemyScene.instance()
	Enemy.setup(GLOBAL.MISSILE, GLOBAL.MISSILE_SPEED["max"])

func spawn_and_shoot_enemy() -> void:
	var Duplicate = Enemy.duplicate(Node.DUPLICATE_USE_INSTANCING)
	Duplicate.set_random_color()
	Duplicate.update_collision_layer()
	$Enemies.add_child(Duplicate)

	$SpawnArea/SpawnLocation.set_offset(randi())
	Duplicate.global_position = $SpawnArea/SpawnLocation.position
	var _rotation: int = -275
	var direction: Vector2 = (Vector2(0, 1080) - Duplicate.global_position) / 100
	Duplicate.rotation = deg2rad(_rotation)
	Duplicate.shoot(direction)

# --- Signals ---

func _on_SpawnTimer_timeout():
	self.spawn_and_shoot_enemy()
