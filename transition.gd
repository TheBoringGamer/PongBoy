extends Control

const GameScene = preload("res://levelAI.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	print("Timwr stop")
	var game = GameScene.instantiate()
	get_tree().change_scene_to_packed(GameScene)
