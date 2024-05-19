extends CharacterBody2D
 
@export var bullet_node: PackedScene
 
 
func _physics_process(_delta):
	velocity = Input.get_vector("ui_left","ui_right","ui_up","ui_down") * 250
	move_and_slide()
 
