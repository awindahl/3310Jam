extends StaticBody2D

var tick = false
var SmallMeteor = preload("res://Scenes/SmallMeteor.tscn")
var player
const TYPE = "METEOR"

func _ready():
	player = get_parent().get_parent().get_node("Player")
	randomize()
	var i = rand_range(0,48)
	
	global_position.y = i

func _move(x,y):
	if tick:
		tick = false
		translate(Vector2(x,y))

func _on_Timer_timeout():
	tick = true
	_move(-1,0)

func _on_Area2D_body_entered(body):
	if body.TYPE == "PLAYER":
		body._die()
	elif body.TYPE == "LASER": 
		player.laserCount -= 1
		body.queue_free()
		queue_free()