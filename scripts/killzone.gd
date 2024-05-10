extends Area2D

@export var player_wall = 0
@onready var game_manager = %GameManager


func _on_body_entered(_body):
	print ("GAME OVER")
	game_manager.game_over(player_wall)
