extends ColorRect

var tokenScene = preload("res://Objects/Token.tscn")

var type


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func get_drag_data(position):
	set_drag_preview(tokenScene.instance())
	return true
	pass
