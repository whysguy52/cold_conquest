extends KinematicBody


#var weight = 1.0
var rotationSpeed = 0.05
var isRotating:bool
var targetAngle:Basis

# Called when the node enters the scene tree for the first time.
func _ready():
    targetAngle = global_transform.basis

func _physics_process(_delta):
    #works but not as intended
    if targetAngle.is_equal_approx(transform.basis):
        transform.basis = transform.basis.slerp(targetAngle,1).orthonormalized()
    else:
        transform.basis = transform.basis.slerp(targetAngle, rotationSpeed).orthonormalized()


func set_new_angle(camAngle:Basis):
    isRotating = true
    targetAngle = camAngle

func turnShip():
    transform.basis = transform.basis.slerp(targetAngle, rotationSpeed).orthonormalized()




# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass
