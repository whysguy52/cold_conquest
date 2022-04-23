extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.


func assign_ship_number():
    NetworkManager.myPlayerData["shipNum"] = 2
    rpc("update_other_lists",NetworkManager.playerList)
    print(NetworkManager.playerList)

remote func update_other_lists(updatedList):
    NetworkManager.playerList = updatedList
    get_tree().get_root().get_node("LobbyMenu").render_player_list()
    print(NetworkManager.playerList)
