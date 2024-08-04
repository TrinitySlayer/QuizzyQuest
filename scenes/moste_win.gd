extends Node2D

func _ready():
	pass

func _process(delta):
	change_scene()

func _on_sej_transition_point_body_entered(body):
	if body.has_method("player"):
		global2.transition_scene = true

func _on_sej_transition_point_body_exited(body):
	if body.has_method("player"):
		global2.transition_scene = false

func change_scene():
	if global2.transition_scene == true:
		if global2.current_scenes == "moste_win":
			get_tree().change_scene_to_file("res://scenes/sej.tscn")
			global2.finish_changescenes()
