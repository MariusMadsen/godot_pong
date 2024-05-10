extends Node

@onready var scoreboard_label = $ScoreboardLabel
@onready var timer = $Timer
@onready var audio_stream_player_2d = $AudioStreamPlayer2D

@onready var ball = %ball
@onready var paddle = %paddle
@onready var paddle_2 = %paddle2


func _process(delta):
	if Input.get_action_strength("menu"):
		get_tree().change_scene_to_file("res://scenes/menu.tscn")
	
func game_over(winner):
	var scoreboard = get_node("/root/Scoreboard")
	
	if (winner == 1):
		scoreboard.score1 += 1
		scoreboard.server = 0
	elif(winner == 0):
		scoreboard.score2 += 1
		scoreboard.server = 1
		
	audio_stream_player_2d.play()
	timer.start()

func _on_ready():
		var scoreboard = get_node("/root/Scoreboard")
		scoreboard_label.text = str(scoreboard.score1) + " - " + str(scoreboard.score2)
		
		if scoreboard.server == 0:
			paddle.serve(ball)
		elif scoreboard.server == 1:
			paddle_2.serve(ball)


func _on_timer_timeout():
	get_tree().reload_current_scene()
