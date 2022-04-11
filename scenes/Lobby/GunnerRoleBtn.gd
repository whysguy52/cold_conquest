extends "res://scripts/label_hover.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
  pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_gui_input(event):
  #needs to clear other slots if the player is changing ship or role
  if event.is_pressed():
    NetworkManager.myPlayerData["role"] = "gunner"
    NetworkManager.playerList[get_tree().get_network_unique_id()] = NetworkManager.myPlayerData
    get_parent().get_node("GunnerSlot").text = NetworkManager.myPlayerData["userName"] #get_tree().get_root().get_node("LobbyMenu").render_player_list()
    get_parent().get_parent().assign_ship_number()
    #print(NetworkManager.playerList)
