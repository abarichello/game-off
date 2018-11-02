extends RigidBody2D

const SPEED: float = 5.0

func _ready():
	self.gravity_scale = 0.0

func shoot(at: Vector2) -> void:
	var direction = (at - self.global_position)
	self.linear_velocity = at * SPEED

func _on_VisibilityNotifier2D_screen_exited():
	self.queue_free()
