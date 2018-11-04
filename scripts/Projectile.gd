extends RigidBody2D

var MissileSprite: Texture = load("res://resources/img/missile-placeholder.png")
var BulletSprite: Texture = load("res://resources/img/bullet-placeholder.png")

var sprite_type: int
var speed: float = GLOBAL.DEF_SPEED

func _ready():
	self.gravity_scale = 0.0
	self.friction = 0

func setup(sprite_type: int, speed: float) -> void:
	self.sprite_type = sprite_type
	self.speed = speed

	if sprite_type == GLOBAL.BULLET:
		$Mask/Sprite.set_texture(self.BulletSprite)
	else:
		$Mask/Sprite.set_texture(self.MissileSprite)

func shoot(at: Vector2) -> void:
	var direction = (at - self.global_position)
	self.linear_velocity = at * speed

func set_random_color() -> void:
	$Mask.set_random_color()

func update_collision_layer():
	if $Mask.highlighted:
		self.set_collision_layer_bit(GLOBAL.HIGH_COLLISION, 1)
		self.set_collision_mask_bit(GLOBAL.HIGH_COLLISION, 1)
	else:
		self.set_collision_layer_bit(GLOBAL.LOW_COLLISION, 1)
		self.set_collision_mask_bit(GLOBAL.LOW_COLLISION, 1)

# --- Signals ---

func _on_VisibilityNotifier2D_screen_exited():
	self.queue_free()
