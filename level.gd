extends Node2D

@onready var timer_label: Label = $CanvasLayer2/StartTimer/TimerLabel
@onready var timer: Timer = $Timer
@onready var go_timer: Timer = $GoTimer
@onready var start_timer: Control = $CanvasLayer2/StartTimer
@onready var space_label: Label = $CanvasLayer2/PressSpace/SpaceLabel
@onready var win_label: Label = $CanvasLayer2/PressSpace/WinLabel

var MainMenu = load("res://title.tscn")
var timer_count: int
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if GameManager.left_player_score == 0 and GameManager.right_player_score == 0:
		timer_count = 3
		timer_label.text = str(timer_count)
		start_timer.show()
		space_label.hide()
		win_label.hide()
		get_tree().paused = true
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		if GameManager.left_player_score == 5 or GameManager.right_player_score == 5:
			var menu = MainMenu.instantiate()
			get_tree().change_scene_to_packed(MainMenu)
		else:
			get_tree().reload_current_scene()
			space_label.hide()

func _on_left_paddle_scoring_area_body_exited(body: Node2D) -> void:
	GameManager.right_player_score += 1
	GameManager.scored.emit()
	print("Left Scored %d" % GameManager.left_player_score  )
	space_label.show()
	
	if GameManager.right_player_score == 5:
		win_label.text = "CPU WINS :("
		win_label.show()
	
	
func _on_right_paddle_scoring_area_body_exited(body: Node2D) -> void:
	GameManager.left_player_score += 1
	GameManager.scored.emit()
	print("Right Scored %d" % GameManager.right_player_score)
	space_label.show()

	if GameManager.left_player_score == 5:
		win_label.text = "YOU WIN :)"
		win_label.show()
		
func _on_timer_timeout() -> void:
	if timer_count > 1:
		timer_count -= 1
		timer_label.text = str(timer_count)
		timer.start()
	else:
		timer_label.text = "Go!"
		go_timer.start()


func _on_go_timer_timeout() -> void:
	start_timer.hide()
	get_tree().paused = false
