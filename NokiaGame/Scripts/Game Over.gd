extends Node2D

var tick = false

func _unhandled_input(event):
	if event.is_action_pressed("ui_accept") and tick:
		get_tree().change_scene("res://Scenes/Transition.tscn")

func _on_Timer_timeout():
	tick = true