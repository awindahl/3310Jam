extends StaticBody2D

var tick = false
var player
const TYPE = "METEOR"

func _ready():
	player = get_parent().get_parent().get_parent().get_node("Player")
	randomize()
	var i = rand_range(-8, 8)
	
	global_position = get_parent().global_position
	global_position.y += i
	
func _move(x,y):
	if tick:
		tick = false
		translate(Vector2(x,y))

func _on_Timer_timeout():
	tick = true
	_move(-2,0)

func _on_Area2D_body_entered(body):
	if body.TYPE == "PLAYER":
		body._die()
	elif body.TYPE == "LASER": 
		player.laserCount -= 1
		body.queue_free()
		_die()

func _die():
	get_parent().get_parent().get_parent().score += 2
	queue_free()