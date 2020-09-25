extends KinematicBody2D


#const TILE_SIZE = 16
#const MAX_SPEED = 64
#
#
#var direction = Vector2()
#var speed = 0
#var is_moving = false
#var velocity = Vector2()
#
#
## Called when the node enters the scene tree for the first time.
#func _ready():
#	set_physics_process(true)
#
#
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _physics_process(delta):
#	is_moving = Input.is_action_pressed("ui_up") or Input.is_action_pressed("ui_right") or Input.is_action_pressed("ui_down") or Input.is_action_pressed("ui_left")
#	if is_moving:
#		speed = MAX_SPEED
#		if Input.is_action_pressed("ui_up") and Input.is_action_pressed("ui_down") or Input.is_action_pressed("ui_left") and Input.is_action_pressed("ui_right"):
#			direction = Vector2.ZERO
#		elif Input.is_action_pressed("ui_up"):
#			direction = Vector2(0,-1)
#		elif Input.is_action_pressed("ui_right"):
#			direction = Vector2(1,0)
#		elif Input.is_action_pressed("ui_down"):
#			direction = Vector2(0,1)
#		elif Input.is_action_pressed("ui_left"):
#			direction = Vector2(-1,0)
#
#	else:
#		speed = 0
#	velocity = speed * direction * delta
#	move_and_collide(velocity)

#const SPEED = 64
#const TILE_SIZE = 16
#
#var last_position = Vector2()
#var target_position = Vector2()
#var movedir = Vector2()
#
## Called when the node enters the scene tree for the first time.
#func _ready():
#	position = position.snapped(Vector2(TILE_SIZE,TILE_SIZE))
#	position += Vector2.ONE * TILE_SIZE/2
#
#func _unhandled_input(event):
#	var left = Input.is_action_pressed("ui_left")
#	var right = Input.is_action_pressed("ui_right")
#	var up = Input.is_action_pressed("ui_up")
#	var down = Input.is_action_pressed("ui_down")
#
#	movedir.x = -int(left) + int(right)
#	movedir.y = -int(up) + int(down)
#	if movedir.x != 0 && movedir.y != 0:
#		movedir = Vector2.ZERO
#	move(movedir)
#
#
#func move(dir):
#	position += dir * TILE_SIZE

const SPEED = 64
const TILE_SIZE = 16

var last_position = Vector2()
var target_position = Vector2()
var movedir = Vector2()

onready var ray = $RayCast2D

func _ready():
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
		if position.distance_to(last_position) >= TILE_SIZE - SPEED * delta:
			position = target_position
	
	if position == target_position:
		get_movedir()
		last_position = position
		target_position += movedir * TILE_SIZE

func get_movedir():
	var left = Input.is_action_pressed("ui_left")
	var right = Input.is_action_pressed("ui_right")
	var up = Input.is_action_pressed("ui_up")
	var down = Input.is_action_pressed("ui_down")
	
	movedir.x = -int(left) + int(right)
	movedir.y = -int(up) + int(down)
	
	if movedir.x != 0 && movedir.y != 0:
		movedir = Vector2.ZERO
	if movedir != Vector2.ZERO:
		ray.cast_to = movedir * TILE_SIZE / 2

