extends KinematicBody2D

var tick = false
var  laser = preload("res://Scenes/Laser.tscn")
var laserCount = 0
const STAGE_W = 84
const STAGE_H = 48
var canShoot = true

func _process(delta):

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
	
	if Input.is_action_just_pressed("ui_accept") and laserCount < 3 and canShoot:
		canShoot = false
		$ShootTimer.start()
		laserCount += 1
		var newLaser = laser.instance()
		get_parent().add_child(newLaser)
	
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

func _on_ShootTimer_timeout():
	canShoot = true