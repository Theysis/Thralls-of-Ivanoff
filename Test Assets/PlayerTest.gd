extends KinematicBody2D

const SPEED = 64
const TILE_SIZE = 16 #grid unit size

var last_position = Vector2()
var target_position = Vector2()
var movedir = Vector2()
var can_move = true;

onready var ray = $RayCast2D

func _ready():#aligns player to grid
	position = position.snapped(Vector2(TILE_SIZE,TILE_SIZE)) 
	position += Vector2.ONE * TILE_SIZE/2
	last_position = position
	target_position = position

func _process(delta):
	if ray.is_colliding():
		position = last_position
		target_position = last_position
	else:
		position += SPEED * movedir * delta
		if position.distance_to(last_position) >= TILE_SIZE - SPEED * delta: #checks if player is not snapped to grid
			position = target_position
	
	#idle state/moved one tile: checks for movement
	if position == target_position:
		get_movedir()
		last_position = position
		target_position += movedir * TILE_SIZE
		
	if Input.is_action_pressed("ui_accept"): #disables movement when menu is open
		if can_move == true:
			can_move = false
		else:
			can_move = true
func get_movedir(): #checks for input 
	var left = Input.is_action_pressed("ui_left")
	var right = Input.is_action_pressed("ui_right")
	var up = Input.is_action_pressed("ui_up")
	var down = Input.is_action_pressed("ui_down")
	if can_move:
		movedir.x = -int(left) + int(right) #casts the bools as ints then adds them
		movedir.y = -int(up) + int(down)
	
	
	if movedir.x != 0 && movedir.y != 0:
		movedir = Vector2.ZERO # disables diagonal movement
	if movedir != Vector2.ZERO: #player is moving
		ray.cast_to = movedir * TILE_SIZE / 2 # moves the raycast to the direction the player is looking
	if movedir == Vector2.ZERO:
		$AnimatedSprite.stop()
	if movedir.x == -1:
		$AnimatedSprite.play("walkleft")
	elif movedir.x == 1:
		$AnimatedSprite.play("walkright")
	elif movedir.y == 1:
		$AnimatedSprite.play("walkdown")
	elif movedir.y == -1:
		$AnimatedSprite.play("walkup")

