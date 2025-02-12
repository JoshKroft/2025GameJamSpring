extends CanvasLayer

func _on_restart_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Menus/StoryScreen.tscn")


func _on_quit_button_pressed() -> void:
	get_tree().quit()
