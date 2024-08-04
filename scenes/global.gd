extends Node

var player_current_attack = false

var current_scenes = "world" 
var transition_scene = false

var player_exit_cliffside_posx = 0
var player_exit_cliffside_posy = 0
var player_start_posx = 0
var player_start_posy = 0
 
func finish_changescenes():
	if transition_scene == true:
		transition_scene = false
		if current_scenes == "world.tscn":
			current_scenes = "cliff_side.tscn" 
		else:
			current_scenes = "world.tscn"
