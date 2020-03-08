extends Node

var explosion = preload("res://explosion/Explosion.tscn")

func _ready():
	$Player.connect("hit", self, "show_hit")

func show_hit(location):
	var explosion_instance = explosion.instance()
	
	add_child(explosion_instance)
	explosion_instance.set_offset(location)
	explosion_instance.play("hit")

