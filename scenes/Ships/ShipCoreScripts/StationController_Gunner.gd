extends "res://scenes/Ships/ShipCoreScripts/BaseController.gd"


var cameraRotVect:Basis
var gunController

# Called when the node enters the scene tree for the first time.
func _ready():
    gunController = get_parent().get_node("ShipBody/GunController")

func _physics_process(_delta):
    if Input.is_action_pressed("RMB"):
        cameraRotVect = $CameraOrbit/CameraNod.global_transform.basis
        gunController.set_new_angle(cameraRotVect)
