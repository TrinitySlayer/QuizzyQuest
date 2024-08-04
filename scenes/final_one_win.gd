extends Node2D

func _ready():
	pass

func _process(delta):
	change_scene()

func _on_sej_transition_point_body_entered(body):
	if body.has_method("player"):
		global5.transition_scene = true

func _on_sej_transition_point_body_exited(body):
	if body.has_method("player"):
		global5.transition_scene = false

func change_scene():
	if global5.transition_scene == true:
		if global5.current_scenes == "final_one_win":
			get_tree().change_scene_to_file("res://scenes/final_two.tscn")
			global5.finish_changescenes()
