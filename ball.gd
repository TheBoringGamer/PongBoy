extends CharacterBody2D


var starting_velocity: Vector2
var speed_multiplier: float
 
func _ready() -> void:
	velocity = Vector2(randf_range(-70, -90),randf_range(-90,90))
	BallState.ballVelocity = velocity

func _physics_process(delta: float) -> void:
	speed_multiplier = 1
	var collision 
	collision = move_and_collide(velocity * delta)
	if collision:
		
		if collision.get_collider() is CharacterBody2D:
			var collision_section
			print(collision.get_collider())
			collision_section = collision.get_collider_shape().name
			var paddle_velocity = collision.get_collider().velocity
			print("Paddle moving at %v" % paddle_velocity)
			if paddle_velocity.y != 0:
				speed_multiplier = 1.1
			if collision_section == "TopCollider":
				print("Change direction TOP")
				if velocity.y <= 0:
				
					velocity = velocity.bounce(collision.get_normal()) * speed_multiplier
						
					print("Velocity up, just bounce")
				else:
					velocity = velocity * -1
					velocity.y = velocity.y * speed_multiplier
					print("Velocity down, bounce UP!")
			if collision_section == "BottomCollider":
				print("Change direction BOTTOM")
				if velocity.y >= 0:
					velocity = velocity.bounce(collision.get_normal()) * speed_multiplier
					
				else:
					velocity = velocity * -1
					velocity.y = velocity.y  * speed_multiplier
			if collision_section == "MainCollider":
				print("BOUNCE!")
				velocity = velocity.bounce(collision.get_normal()) * speed_multiplier
		else:
			velocity = velocity.bounce(collision.get_normal()) * speed_multiplier
		BallState.ballVelocity = velocity
		BallState.ballPosition = global_position
		BallState.ball_bounce.emit()
