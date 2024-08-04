extends Node2D

func _ready():
	pass

func _process(delta):
	change_scene()

func _on_moste_transition_point_body_entered(body):
	if body.has_method("player"):
		global1.transition_scene = true


func _on_moste_transition_point_body_exited(body):
	if body.has_method("player"):
		global1.transition_scene = false

func change_scene():
	if global1.transition_scene == true:
		if global1.current_scenes == "cliff_side_win":
			get_tree().change_scene_to_file("res://scenes/moste.tscn")
			global1.finish_changescenes()
