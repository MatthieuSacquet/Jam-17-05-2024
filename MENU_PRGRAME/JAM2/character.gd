extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var fire_ball_equiped = true
var fire_ball_cooldown = true
var can_shot : bool = true
@onready var fire_ball = preload("res://fire_ball.tscn")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if Input.is_key_pressed(KEY_F) and fire_ball_cooldown and fire_ball_equiped:
		can_shot = false
		$Timer.start()
	
	if Input.is_key_pressed(KEY_LEFT):
		$flip.scale.x = -1
	elif Input.is_key_pressed(KEY_RIGHT):
		$flip.scale.x = 1

	move_and_slide()


func _on_timer_timeout():
	var k = fire_ball.instantiate()
	k.global_position = $flip/position.global_position
	k.vel = $flip.scale.x
	get_parent().add_child(k)
	can_shot = true
