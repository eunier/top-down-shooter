extends Area2D

export (int) var speed
export (int) var damage

var velocity = Vector2()

func start(_position, _direction):
	position = _position
	rotation = _direction
	velocity = _direction * speed

func _process(delta):
	position += velocity + delta
