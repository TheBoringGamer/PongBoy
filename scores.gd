extends Control

@onready var player_score: Label = $MarginContainer/HBoxContainer/PlayerScore
@onready var cpu_score: Label = $MarginContainer/HBoxContainer2/CPUscore

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_update_scores()
	GameManager.scored.connect(_update_scores)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _update_scores() -> void:
	player_score.text = str(GameManager.left_player_score)
	cpu_score.text = str(GameManager.right_player_score)
