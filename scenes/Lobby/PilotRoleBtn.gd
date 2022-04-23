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
    NetworkManager.myPlayerData["role"] = "pilot"
    NetworkManager.playerList[get_tree().get_network_unique_id()] = NetworkManager.myPlayerData
    get_parent().get_node("PilotSlot").text = NetworkManager.myPlayerData["userName"]
    get_parent().get_parent().assign_ship_number()
    rpc("update_pilot_text",NetworkManager.myPlayerData["userName"])

remote func update_pilot_text(userName):
    get_parent().get_node("PilotSlot").text = userName
