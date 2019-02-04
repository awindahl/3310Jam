extends Node2D

var score = 0

func _process(delta):
	$CanvasLayer/Score.text = var2str(score)