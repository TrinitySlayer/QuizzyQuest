extends Control

var database: SQLite
var submit_button: Button
var line_edit: LineEdit

func _ready() -> void:
	grab_focus()
	database = SQLite.new()
	database.path = "res://connection/data.db"
	if database.open_db():
		print("Connected to database")
	else:
		print("Failed to connect to database")
		return
	
	
	line_edit = $Panel/VBoxContainer/MarginContainer3/Player_Name
	submit_button = $Panel/VBoxContainer/MarginContainer2/SubmitButton
	line_edit.grab_focus()
	submit_button.grab_focus()
	
func _on_submit_button_pressed():
	$submitBtn.play()
	var input_text: String = line_edit.text
	line_edit.text = ""

	database.open_db()
	insert_player_name(input_text)

	if input_text != "":
		print("Submitted text: ", input_text)
		get_tree().change_scene_to_file("res://scenes/world.tscn")
	else:
		print("Please enter a valid text before submitting.")

func insert_player_name(player_name: String) -> void:
	var q = "INSERT INTO players (nama) VALUES ('" + player_name + "')"

	if database.query(q) != null:
		print("Player name inserted successfully")
	else:
		print("Failed to insert player name")


func _on_submit_button_mouse_entered():
	$submitBtn.play()
	
func _on_player_name_focus_entered():
	$submitBtn.play()
