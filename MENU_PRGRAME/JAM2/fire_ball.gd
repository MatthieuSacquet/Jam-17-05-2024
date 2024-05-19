extends CharacterBody2D

var speed = 150
var vel : float

func _physics_process(delta):
	move_local_x(vel * speed * delta)
