extends KinematicBody


var weight = 1.0
var rotationSpeed = 0.5
var isRotating:bool
var startAngle:Basis
var targetAngle:Basis


# Called when the node enters the scene tree for the first time.
func _ready():
    targetAngle = global_transform.basis

func _physics_process(delta):
    #somehow weight always stops at 1.0 exactly. I don't get it but it's what i want
    if isRotating == true and weight <1:
        turnShip()
        weight += delta * rotationSpeed
    else:
        isRotating = false


func set_new_angle(camAngle:Basis):
    #add some changes to control when and how to rotate
    #also, make sure rotations are limited.
    weight = 0.0
    isRotating = true
    targetAngle = camAngle
    startAngle = transform.basis.orthonormalized()

func turnShip():
    transform.basis = startAngle.slerp(targetAngle, weight).orthonormalized()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass
