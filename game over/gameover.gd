extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _on_retry_pressed():
	get_tree().change_scene_to_file("res://Player_Name/player_name.tscn")
	
	


func _on_quit_pressed():
	get_tree().quit()
