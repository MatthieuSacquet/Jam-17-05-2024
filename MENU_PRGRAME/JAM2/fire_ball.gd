extends CharacterBody2D

var speed = 150
var vel : float

func _physics_process(delta):
	move_local_x(vel * speed * delta)
	$AnimatedSprite2D.rotation_degrees = 90 * vel

func _on_body_entered():
	queue_free()
	
func _on_area_2d_body_entered(body):
	print(body)
	queue_free()
