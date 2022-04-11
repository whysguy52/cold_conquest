extends "res://scripts/label_hover.gd"

func _on_Label_gui_input(event):
  if event.is_pressed():
# warning-ignore:return_value_discarded
    get_tree().change_scene("res://scenes/OnlinePlayMenu/OnlinePlayMenu.tscn")

