extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func _on_play_button_down():
	
	get_tree().change_scene_to_file("res://Player_Name/player_name.tscn")
	
func _on_quit_button_down():
	$ClickButton.play()
	get_tree().quit()
func _on_play_mouse_entered():
	$ClickButton.play()

func _on_quit_mouse_entered():
	$ClickButton.play()

func _on_play_toggled(toggled_on):
	$ClickButton.play()

func _on_quit_toggled(toggled_on):
	$ClickButton.play()


func _on_play_focus_exited():
	$ClickButton.play()

func _on_quit_focus_exited():
	$ClickButton.play()


func _on_play_pressed():
	$ClickButton.play()
