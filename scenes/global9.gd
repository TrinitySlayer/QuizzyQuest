extends Node

var player_current_attack = false

var current_scenes = "final_five_win" 
var transition_scene = false

var player_exit_sejwin_posx = 0
var player_exit_sejwin_posy = 0
var player_start_posx = 0
var player_start_posy = 0
 
func finish_changescenes():
	if transition_scene == true:
		transition_scene = false
		if current_scenes == "final_five_win.tscn":
			current_scenes = "final_six.tscn" 
		else:
			current_scenes = "final_five_win.tscn"
