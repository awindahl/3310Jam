extends KinematicBody2D

var velocity = Vector2()
var tick = false
var  laser = preload("res://Scenes/Laser.tscn")
const STAGE_W = 84
const STAGE_H = 48
var LEFT = 0
var RIGHT = 0
var UP = 0
var DOWN = 0

# supress delta
func _process(delta):
	
	LEFT = global_position.x - 16
	RIGHT = global_position.x + 32
	UP = global_position.y -16
	DOWN = global_position.y + 32
	
	print (global_position)
	if Input.is_action_pressed("ui_left"):
		_move(-1,0)
		_wrap(global_position.x, 0, STAGE_W, 0)
	elif Input.is_action_pressed("ui_right"):
		_move(1,0)
		_wrap(global_position.x, 0, STAGE_W, 0)
	if Input.is_action_pressed("ui_up"):
		_move(0,-1)
		_wrap(global_position.y, 0, STAGE_H, 1)
	elif Input.is_action_pressed("ui_down"):
		_move(0,1)
		_wrap(global_position.y, 0, STAGE_H, 1)
	
func _move(x,y):
	if tick:
		translate(Vector2(x,y))
		tick = false

func _on_Timer_timeout():
	tick = true

func _wrap(ship_pos, stagemin, stagemax, dir):
	if not dir:
		if ship_pos < stagemin:
			global_position.x = stagemax
		elif ship_pos > stagemax:
			global_position.x = stagemin
		else:
			global_position.x = ship_pos
	else:
		if ship_pos < stagemin:
			global_position.y = stagemax
		elif ship_pos > stagemax:
			global_position.y = stagemin
		else:
			global_position.y = ship_pos