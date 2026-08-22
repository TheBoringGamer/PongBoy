extends CharacterBody2D

const SPEED = 300.0
var ball_approach: bool = false

func _ready() -> void:
	BallState.ball_bounce.connect(_ball_bounce_react)

func _physics_process(delta: float) -> void:

	
	if ball_approach:
		var ball_position = get_parent().get_node("Ball").global_position
		if ball_position.y > global_position.y:
			velocity.y = move_toward(0, SPEED, 50)
		else:
			velocity.y = move_toward(0, -SPEED, 50)
	

	move_and_slide()

func _ball_bounce_react():
	
	if BallState.ballVelocity.x < 0:
		print("Ball away!")
		ball_approach = false
	else:
		print("Ball approaching")
		ball_approach = true
		
