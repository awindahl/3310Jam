extends Node2D

var Meteor = preload("res://Scenes/Meteor.tscn")

func _on_Timer_timeout():
	var newMeteor = Meteor.instance()
	add_child(newMeteor)