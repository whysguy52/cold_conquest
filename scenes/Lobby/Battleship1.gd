extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func assign_ship_number():
	NetworkManager.myPlayerData["shipNum"] = 1
	rpc("update_other_lists",NetworkManager.playerList)
	print(NetworkManager.playerList)

remote func update_other_lists(updatedList):
	NetworkManager.playerList = updatedList
	print(NetworkManager.playerList)
