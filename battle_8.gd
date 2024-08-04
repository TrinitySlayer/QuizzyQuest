extends Control

signal textbox_closed

@export var enemy : Resource

var current_player_health = 0
var current_enemy_health = 0

func _ready():
	set_health($CikguSej6Container/ProgressBar, enemy.health, enemy.health)
	set_health($PlayerPanel/PlayerData/ProgressBar, State.current_health, State.max_health)
	$CikguSej6Container/CikguSej6.texture = enemy.texture
	
	current_player_health = State.current_health
	current_enemy_health = enemy.health
	
	$TextBox.hide()
	$ActionPanel.hide()
	
	display_text(" Alamak!! Cikgu Sejarah cuba memberi didikan agama! jawab 
	 soalan Cikgu Sejarah untuk membuktikan diri anda beriman! ")
	await textbox_closed
	$ActionPanel.show()
	
	display_text(" %s : Assalamualaikum Jawap soalan ni! 
	 Apakah rukun islam yang selalu ditinggalkan? " % enemy.name.to_upper())
	await textbox_closed
	$ActionPanel.show()

func set_health(progress_bar, health, max_health):
	progress_bar.value = health
	progress_bar.max_value = max_health
	progress_bar.get_node("Label").text = "HP: %d/%d" % [health,max_health]

func _input(event):
	if (Input.is_action_just_pressed("ui_accept") or Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)) and $TextBox.visible:
		$TextBox.hide()
		emit_signal("textbox_closed")

func display_text(text):
	$TextBox.show()
	$TextBox/Label.text = text
	

func _on_lari_pressed():
	display_text("Penakut!")
	await textbox_closed
	await get_tree().create_timer(.25).timeout
	get_tree().change_scene_to_file("res://scenes/moste.tscn") #Tukar jadi PENAKUT scene

func _on_jawapan_1_pressed():
	display_text(" Jawapan anda betul! ")
	await textbox_closed
	
	current_enemy_health = max(0, current_enemy_health - State.damage)
	set_health($CikguSej6Container/ProgressBar, current_enemy_health, enemy.health)
	
	$AnimationPlayer.play("enemy_damaged")
	await $AnimationPlayer.animation_finished
	
	if current_enemy_health == 0:
		display_text(" Anda berjaya menjawab soalan %s, 
		 teruskan ke tempat seterusnya. " % enemy.name)
		await textbox_closed
		
		$AnimationPlayer.play("enemy_died")
		await $AnimationPlayer.animation_finished
		
		await get_tree().create_timer(.25).timeout
		get_tree().change_scene_to_file("res://scenes/final_five_win.tscn") #Jangan tukar
	
func _on_jawapan_2_pressed():
	display_text(" Jawapan anda Salah! ")
	await textbox_closed
	
	current_player_health = max(0, current_player_health - enemy.damage)
	set_health($PlayerPanel/PlayerData/ProgressBar, current_player_health, State.max_health)
	
	$AnimationPlayer.play("enemy_attack")
	await $AnimationPlayer.animation_finished
	
	if current_player_health == 0:
		display_text(" Anda tidak berjaya menjawab soalan yang 
		 diberikan oleh %s, ANDA LEMAH!!! " % enemy.name)
		await textbox_closed
		
		await get_tree().create_timer(.25).timeout
		get_tree().change_scene_to_file("res://scenes/moste.tscn") #Tukar jadi GAME OVER scene
	
		
func _on_jawapan_3_pressed():
	display_text(" Jawapan anda Salah! ")
	await textbox_closed
	
	current_player_health = max(0, current_player_health - enemy.damage)
	set_health($PlayerPanel/PlayerData/ProgressBar, current_player_health, State.max_health)
	
	$AnimationPlayer.play("enemy_attack")
	await $AnimationPlayer.animation_finished
	
	if current_player_health == 0:
		display_text(" Anda tidak berjaya menjawab soalan yang 
		 diberikan oleh %s, ANDA LEMAH!!! " % enemy.name)
		await textbox_closed
		
		await get_tree().create_timer(.25).timeout
		get_tree().change_scene_to_file("res://scenes/moste.tscn") #Tukar jadi GAME OVER scene
