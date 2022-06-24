extends "res://scenes/Ships/ShipCoreScripts/BaseController.gd"

var cameraRotVect:Basis
var shipOrigin
var shipRotator
var thrustersFactor = 0
var warpFactor = 0


# Called when the node enters the scene tree for the first time.
func _ready():
    shipOrigin = get_parent()
    shipRotator = get_parent().get_node("ShipBody")

func _physics_process(_delta):
    if Input.is_action_pressed("RMB"):
        cameraRotVect = $CameraOrbit/CameraNod.global_transform.basis
        shipRotator.set_new_angle(cameraRotVect)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass
