extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
# warning-ignore:return_value_discarded
  NetworkManager.connect("player_connected", self, "_on_player_connected")
# warning-ignore:return_value_discarded
  NetworkManager.connect("player_disconnected", self, "_on_player_disconnected")
  print("We are ready")


func initiate_server():
  print("hello lobby")

func _on_player_connected():
  print("Player Connected and stuff")
  
