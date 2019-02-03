extends KinematicBody2D

var tick = false
var player

func _ready():
	$AnimationPlayer.play("Laser")
	
	player = get_parent().get_node("Player") 
	global_position = player.global_position
	global_position.x += 10

func _move(x,y):
	if tick:
		translate(Vector2(x,y))
		tick = false

func _on_Timer_timeout():
	tick = true
	_move(1,0)

func _collide():
	player.laserCount -= 1
	queue_free()
	