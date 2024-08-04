extends Node

var player_current_attack = false

var current_scenes = "cliff_side_win" 
var transition_scene = false

var player_exit_cliffsidewin_posx = 0
var player_exit_cliffsidewin_posy = 0
var player_start_posx = 0
var player_start_posy = 0
 
func finish_changescenes():
	if transition_scene == true:
		transition_scene = false
		if current_scenes == "cliff_side_win.tscn":
			current_scenes = "moste.tscn" 
		else:
			current_scenes = "cliff_side_win.tscn"
