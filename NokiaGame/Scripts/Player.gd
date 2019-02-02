extends KinematicBody2D

var velocity = Vector2()

# supress delta
func _process(delta):
	if Input.is_action_pressed("ui_left"):
		velocity = Vector2(-10,0)
	elif Input.is_action_pressed("ui_right"):
		velocity = Vector2(10,0)
	else:
		velocity.x = 0
	if Input.is_action_pressed("ui_up"):
		velocity = Vector2(0,-10)
	elif Input.is_action_pressed("ui_down"):
		velocity = Vector2(0,10)
	else:
		velocity.y = 0
	
	velocity = move_and_slide(velocity)