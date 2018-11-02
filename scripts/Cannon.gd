extends "res://scripts/ColoredEntity.gd"

onready var Bullet: PackedScene = preload("res://scenes/Projectile.tscn")
const RATE_OF_CHANGE: float = 0.5
const UPPER_LIMIT: int = -85
const LOWER_LIMIT: int = -10

var angle = -45

func _ready():
	pass

func _process(delta):
	$Sprite.set_rotation(deg2rad(self.angle))

func _input(event):
	if Input.is_action_pressed("ui_up"):
		if self.angle > UPPER_LIMIT:
			self.move_up()
	if Input.is_action_pressed("ui_down"):
		if self.angle < LOWER_LIMIT:
			self.move_down()

func move_up():
	self.angle -= RATE_OF_CHANGE

func move_down():
	self.angle += RATE_OF_CHANGE

func shoot() -> void:
	if $FireCooldown.time_left == 0:
		var NewBullet = Bullet.instance()
		NewBullet.global_position = $Sprite/CannonTip.global_position
		NewBullet.rotation_degrees = self.angle
		var at: Vector2 = $Sprite/CannonTip.global_position - $Sprite/CannonBase.global_position
		NewBullet.shoot(at)

		var BulletSprite = NewBullet.get_node("Mask")
		if self.highlighted:
			BulletSprite.highlight()
		else:
			BulletSprite.lowlight()

		$Projectiles.add_child(NewBullet)
		$FireCooldown.start()

# --- Signals ---

func _on_FireCooldown_timeout():
	pass # Replace with function body.
