extends Label

var database: SQLite

func _ready() -> void:
	database = SQLite.new()
	database.path = "res://connection/data.db"

	if database.open_db():
		print("Connected to database")
	else:
		print("Failed to connect to database")
		return

	# Fetch and display data when the scene is ready
	fetch_and_display_data()

func fetch_and_display_data() -> void:
	database.open_db()
	database.query("SELECT * FROM players ORDER BY id DESC LIMIT 1")

	self.text = ""  # Clear existing text before adding new data

	if database.query_result.size() > 0:
		# Display only the latest data
		self.text = str(database.query_result[0]["nama"])

	database.close_db()
