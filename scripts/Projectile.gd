extends RigidBody2D

var sprite: int
var speed: float = GLOBAL.DEF_SPEED

func _ready():
	self.gravity_scale = 0.0

func setup(sprite: int, speed: float) -> void:
	self.sprite = sprite
	self.speed = speed

	# TODO Replace sprite

func shoot(at: Vector2) -> void:
	var direction = (at - self.global_position)
	self.linear_velocity = at * speed

func _on_VisibilityNotifier2D_screen_exited():
	self.queue_free()
