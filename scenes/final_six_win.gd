extends Node2D

func _ready():
	pass

func _process(delta):
	change_scene()

func _on_sej_transition_point_body_entered(body):
	if body.has_method("player"):
		global10.transition_scene = true

func _on_sej_transition_point_body_exited(body):
	if body.has_method("player"):
		global10.transition_scene = false

func change_scene():
	if global10.transition_scene == true:
		if global10.current_scenes == "final_six_win":
			get_tree().change_scene_to_file("res://scenes/congratulation.tscn")
			global10.finish_changescenes()
