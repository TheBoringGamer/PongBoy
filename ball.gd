extends CharacterBody2D

var starting_velocity: Vector2

func _ready() -> void:
	velocity = Vector2(randf_range(-70, -90),randf_range(-90,90))

func _physics_process(delta: float) -> void:

	var collision 
	collision = move_and_collide(velocity * delta)
	if collision:
		#print(velocity)
		#velocity = velocity.bounce(collision.get_normal())
		#print(velocity)
		#print(collision.get_collider().get_class())
		if collision.get_collider() is CharacterBody2D:
			var collision_section
			print(collision.get_collider())
			collision_section = collision.get_collider_shape().name
			if collision_section == "TopCollider":
				print("Change direction TOP")
				if velocity.y <= 0:
					velocity = velocity.bounce(collision.get_normal())
					print("Velocity up, just bounce")
				else:
					velocity = velocity * -1
					print("Velocity down, bounce UP!")
			if collision_section == "BottomCollider":
				print("Change direction BOTTOM")
				if velocity.y >= 0:
					velocity = velocity.bounce(collision.get_normal())
					
				else:
					velocity = velocity * -1
			if collision_section == "MainCollider":
				print("BOUNCE!")
				velocity = velocity.bounce(collision.get_normal())
		else:
			velocity = velocity.bounce(collision.get_normal())
