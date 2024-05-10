extends CharacterBody2D

@export var player_id = 0;

const SPEED = 40000;
const topY = 323
const minY = -323

var serving = false
var ball: CharacterBody2D = null;

func serve(ballToServe):
	serving = true
	ball = ballToServe

func _physics_process(delta):
	
	if (serving):
		if player_id == 0:
			ball.position = position+Vector2(20,0)
		elif player_id == 1:
			ball.position = position+Vector2(-20,0)
	
	if (serving && Input.get_action_strength("shoot")):
		if (player_id == 0):
			ball.serve(1)	
		if (player_id == 1):
			ball.serve(-1)
		serving = false	
	
	if (player_id == 0):
		var direction = Input.get_axis("player_1_up", "player_1_down")
		velocity.y = clampVel(direction, delta)
	elif (player_id == 1):
		var direction = Input.get_axis("player_2_up", "player_2_down")
		velocity.y = clampVel(direction, delta)
	

	move_and_slide()

func clampVel(direction, delta) :
	return clamp(SPEED*delta*direction, minY, topY)
