extends Control



func _on_start_pressed():
	get_tree().change_scene_to_file("res://GAME/box_fight.tscn")


func _on_settings_pressed():
	get_tree().change_scene_to_file("res://MENU/SETTINGS_MENU/settings_menu.tscn")


func _on_quit_pressed():
	get_tree().quit()
