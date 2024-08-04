extends CharacterBody2D

const speed = 250
var current_dir = "none"

var npc_1_in_range = false
var cikgu_math_in_range = false
var cikgu_agama_in_range = false
var cikgu_sej_in_range = false

func _ready():
	$AnimatedSprite2D.play("front_idle")

func _physics_process(delta):
	player_movement(delta)
	current_camera()
	
	if npc_1_in_range == true:
		if Input.is_action_just_pressed("ui_accept"):
			DialogueManager.show_example_dialogue_balloon(load("res://dialogue/main.dialogue"), "intro")
			return
			
	if cikgu_math_in_range == true:
		if Input.is_action_just_pressed("ui_accept"):
			get_tree().change_scene_to_file("res://scenes/Battle.tscn")
			
	if cikgu_agama_in_range == true:
		if Input.is_action_just_pressed("ui_accept"):
			get_tree().change_scene_to_file("res://scenes/Battle_1.tscn")
			
	if cikgu_sej_in_range == true:
		if Input.is_action_just_pressed("ui_accept"):
			get_tree().change_scene_to_file("res://scenes/Battle_2.tscn")

func player_movement(delta):
	
	if Input.is_action_pressed("ui_right"):
		current_dir = "right"
		play_anim(1)
		velocity.x = speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_left"):
		current_dir = "left"
		play_anim(1)
		velocity.x = -speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_down"):
		current_dir = "down"
		play_anim(1)
		velocity.y = speed
		velocity.x = 0
	elif Input.is_action_pressed("ui_up"):
		current_dir = "up"
		play_anim(1)
		velocity.y = -speed
		velocity.x = 0
	else:
		play_anim(0)
		velocity.x = 0
		velocity.y = 0
	
	move_and_slide()
	
func play_anim(movement):
	var dir = current_dir
	var anim = $AnimatedSprite2D
	
	if dir == "right":
		anim.flip_h = false
		if movement == 1:
			anim.play("side_walk")
		elif movement == 0:
			anim.play("side_idle")
	if dir == "left":
		anim.flip_h = true
		if movement == 1:
			anim.play("side_walk")
		elif movement == 0:
			anim.play("side_idle")
	
	if dir == "down":
		anim.flip_h = false
		if movement == 1:
			anim.play("front_walk")
		elif movement == 0:
			anim.play("front_idle")
	if dir == "up":
		anim.flip_h = true
		if movement == 1:
			anim.play("back_walk")
		elif movement == 0:
			anim.play("back_idle")
			
func player():
	pass
	
func current_camera():
	if global.current_scenes == "world.tscn":
		$world_camera.enabled = true
		$cliffside_camera.enabled = false
	elif global.current_scenes == "cliff_side.tscn":
		$world_camera.enabled = false
		$cliffside_camera.enabled = true
	elif global.current_scenes == "cliff_side_win.tscn":
		$world_camera.enabled = false
		$cliffside_camera.enabled = true


func _on_detection_area_body_entered(body):
	if body.has_method("npc_1"):
		npc_1_in_range = true
	if body.has_method("cikgu_math"):
		cikgu_math_in_range = true
	if body.has_method("cikgu_agama"):
		cikgu_agama_in_range = true
	if body.has_method("cikgu_sej"):
		cikgu_sej_in_range = true


func _on_detection_area_body_exited(body):
	if body.has_method("npc_1"):
		npc_1_in_range = false
	if body.has_method("cikgu_math"):
		cikgu_math_in_range = false
	if body.has_method("cikgu_agama"):
		cikgu_agama_in_range = false
	if body.has_method("cikgu_sej"):
		cikgu_sej_in_range = false
