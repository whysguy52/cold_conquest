extends KinematicBody


var weight = 0.0
var rotationSpeed = 0.05
var isRotating
var targetAngle

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.

func _physics_process(delta):
    if isRotating == true and weight <= 1:
        print_debug(weight)
        turnShip()
        weight += (delta * rotationSpeed)
    else:
        isRotating = false
        weight = 0.0
        

func set_new_angle(camAngle:Basis):
    isRotating = true
    targetAngle = camAngle

func turnShip():
    transform.basis = transform.basis.slerp(targetAngle.orthonormalized(), rotationSpeed)




# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass
