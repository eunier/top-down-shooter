extends Node

func _ready():
	$Player.connect("hit", self, "show_hit")

func show_hit(location):
	pass
