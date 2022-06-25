extends KinematicBody


var weight = 1.0
var rotationSpeed = 0.05
var isRotating:bool
var startAngle:Basis
var targetAngle:Basis

# Called when the node enters the scene tree for the first time.
func _ready():
    targetAngle = global_transform.basis

func _physics_process(delta):
    if isRotating == true and weight <1:
        weight += delta
        turnShip()
    else:
        isRotating = false
        weight = 1
        transform.basis = startAngle.slerp(targetAngle,1).orthonormalized()
    print_debug(isRotating)


func set_new_angle(camAngle:Basis):
    weight = 0.0
    isRotating = true
    targetAngle = camAngle
    startAngle = transform.basis.orthonormalized()

func turnShip():
    transform.basis = startAngle.slerp(targetAngle, weight).orthonormalized()




# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass
