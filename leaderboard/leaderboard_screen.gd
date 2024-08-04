extends Control


func _ready():
	pass


func _on_play_button_down():
	get_tree().change_scene_to_file("res://menu/menu.tscn")
	
	
func _on_quit_button_down():
	get_tree().quit()


func _on_play_mouse_entered():
	$clickBtn.play()


func _on_quit_mouse_entered():
	$clickBtn.play()
