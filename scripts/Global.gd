extends Node

var currentScene = null

func _ready():
	pass

func go_to_scene(nextScene : Node):
	var root = get_tree().get_root()
	currentScene = root.get_child(root.get_child_count() - 1)
	currentScene.queue_free()
	currentScene = nextScene
	get_tree().get_root().add_child(currentScene)
	get_tree().set_current_scene(currentScene)
	
