extends KinematicBody


var weight = 0.0
var rotationSpeed = 0.5
var isRotating
var targetAngle

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.

func _physics_process(delta):
    if isRotating == true and weight <= 1:
        turnShip(targetAngle)
        delta = delta / 2
        weight += delta
    else:
        isRotating = false
        weight = 0.0

func set_new_angle(camAngle:Basis):
    isRotating = true
    targetAngle = camAngle


func turnShip(camAngle:Basis):
    transform.basis = transform.basis.slerp(camAngle.orthonormalized(), weight)



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass
