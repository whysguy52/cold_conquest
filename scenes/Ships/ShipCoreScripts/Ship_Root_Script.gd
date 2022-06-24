extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
    pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass


func _on_StationController_tree_entered():
    var StationControllerRef = get_node("StationController")
    
    match NetworkManager.myPlayerData.role:
        "gunner":
            StationControllerRef.set_script(load("res://scenes/Ships/ShipCoreScripts/StationController_Gunner.gd"))
        "pilot":
            StationControllerRef.set_script(load("res://scenes/Ships/ShipCoreScripts/StationController_Pilot.gd"))
