extends Control

#const MainLevel = preload("res://levelAI.tscn")
const Transition = preload("res://transition.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept") or Input.is_action_just_pressed("ui_select"):
		var game_scene = Transition.instantiate()
		get_tree().change_scene_to_packed(Transition)
