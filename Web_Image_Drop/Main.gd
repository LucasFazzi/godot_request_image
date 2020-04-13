extends Node

const TMP_FILE = "res://tmp.jpg"

func _ready():
	var http = get_node("HTTPRequest")
	http.use_threads = true
	http.set_download_file(TMP_FILE)
	http.request("https://raw.githubusercontent.com/godotengine/godot-design/master/screenshots/editor_tps_demo_1920x1080.jpg")


func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	if result == 0: 
		var loaded = ImageTexture.new()
		loaded.load(TMP_FILE)

		get_node("TextureRect").set_texture(loaded)
