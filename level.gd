extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().reload_current_scene()


func _on_left_paddle_scoring_area_body_exited(body: Node2D) -> void:
	GameManager.left_player_score += 1
	print("Left Scored %d" % GameManager.left_player_score  )
	
func _on_right_paddle_scoring_area_body_exited(body: Node2D) -> void:
	GameManager.right_player_score += 1
	print("Right Scored %d" % GameManager.right_player_score)
