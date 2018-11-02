extends Node

enum SpriteType { BULLET = 0, MISSILE = 1 }

const HIGHLIGHT = Color(1, 1, 0.25)
const LOWLIGHT = Color(0.70, 0.30, 1)

const DEF_SPEED = 5.0
const MISSILE_SPEED = { "max": 7.0, "min": 3.0 }
const BULLET_SPEED = 5.0
