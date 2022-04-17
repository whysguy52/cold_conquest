extends "res://scenes/Ships/BaseController.gd"


var cameraRotVect:Quat
var gunController

# Called when the node enters the scene tree for the first time.
func _ready():
    gunController = get_parent().get_node("GunController")
    pass # Replace with function body.

func _physics_process(_delta):
    if Input.is_action_pressed("RMB"):
        cameraRotVect = $CameraOrbit/CameraNod.global_transform.basis.get_rotation_quat()
        gunController.set_new_angle(cameraRotVect)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass
