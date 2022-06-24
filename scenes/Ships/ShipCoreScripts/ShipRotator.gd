extends KinematicBody


var weight
var isRotating


# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.

func _physics_process(delta):
    if isRotating == true:
        weight += delta

func set_new_angle(camAngle:Basis):
    if !camAngle.is_equal_approx(transform.basis):
        weight = 0
        isRotating = false
        return
    else:
        isRotating = true
        transform.basis = transform.basis.slerp(camAngle, weight)
    




# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass
