extends Area2D

var speed = 250

func _ready():
	set_as_top_level(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += (Vector2.RIGHT * speed).rotated(rotation) * delta
	
func _on_visible_on_screen_enable_2d_srceen_exited():
	queue_free()
