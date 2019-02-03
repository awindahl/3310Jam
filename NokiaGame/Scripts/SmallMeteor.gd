extends StaticBody2D

var tick = false
const TYPE = "METEOR"

func _ready():
	randomize()
	var i = rand_range(get_parent().global_position.y - 4, get_parent().global_position.y + 4)
	global_position.y = i

func _move(x,y):
	if tick:
		tick = false
		translate(Vector2(x,y))

func _on_Timer_timeout():
	tick = true
	_move(-2,0)