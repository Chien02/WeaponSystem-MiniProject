extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -400.0

func _ready() -> void:
	$AnimatedSprite2D.play()

func _physics_process(delta: float) -> void:
	velocity = _movement(velocity, delta)
	move_and_slide()

func _movement(velocity, delta):
	var direction : Vector2 = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if direction:
		velocity = lerp(velocity, velocity + direction * SPEED, delta)
	else:
		velocity = lerp(velocity, Vector2.ZERO, delta)
	
	return velocity
