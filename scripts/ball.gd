extends CharacterBody2D

@onready var sprite_2d = $Sprite2D
@onready var boing = $Boing
@onready var blup = $Blup

@onready var bottom_boundary = %BottomBoundary
@onready var top_boundary = %TopBoundary

const SPEED_X = 10000.0
var speed_y = 10000.0
var direction_x = 1
var direction_y = 1

func serve(dir):
	direction_x = dir

func ball_hit_floor_or_ceiling():
	direction_y *= -1
	blup.play()

func _physics_process(delta):
	if is_on_wall():
		direction_x = direction_x*-1
		speed_y = randf()*SPEED_X*2
		boing.play()
		print(speed_y)
		
	if (direction_x == 1):
		sprite_2d.flip_h = false
	else :
		sprite_2d.flip_h = true
	
	
	velocity.x = delta*SPEED_X*direction_x
	velocity.y = delta*speed_y*direction_y
	
	move_and_slide()
