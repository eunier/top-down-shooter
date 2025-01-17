extends KinematicBody2D

signal hit

export (int) var speed = 4

var velocity = Vector2()
var screen_size

func _ready():
	screen_size = get_viewport_rect().size

func get_input():
	look_at(get_global_mouse_position())
	velocity = Vector2()
	
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	if Input.is_action_pressed("up"):
		velocity.y -= 1
	if Input.is_action_pressed("mouse_left_click"):
		shoot()
	
	velocity = velocity.normalized() * speed
	
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)

func _physics_process(delta):
	get_input()
	velocity = move_and_collide(velocity)

func shoot():
	if $Timer.is_stopped():
		$Timer.start()
		
		if $ShootRayCast2D.is_colliding():
			emit_signal("hit", $ShootRayCast2D.get_collision_point())
		
		$AudioStreamPlayer2D.play()

func _on_AudioStreamPlayer2D_finished():
	pass


func _on_Timer_timeout():
	$Timer.stop()
