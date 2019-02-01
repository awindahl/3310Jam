extends Node2D

# Sumaris Transition script 
var path = "Scenes/Main.tscn"
var time = 5.0
var solo_fade = false

func _ready():
	$AnimationPlayer.play("Transition")

func change_scene():
	get_tree().change_scene(path)
	for i in get_tree().get_root().get_children():
		if i.get_name() != "Transition":
			i.get_tree().set_pause(false)
			break


func _on_AnimationPlayer_animation_finished(anim_name):
	change_scene()