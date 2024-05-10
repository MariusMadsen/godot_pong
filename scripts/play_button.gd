extends BaseButton


func _on_pressed():
	#PLAY GAME
	print("click")
	get_tree().change_scene_to_file("res://scenes/main.tscn")
	
