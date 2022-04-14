extends Spatial


var PivotPoint
var targetRot:Quat
var currentRot:Quat
var weight = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
    PivotPoint = $Body/PivotPoint
    currentRot = transform.basis.get_rotation_quat()

func _physics_process(delta):
    if self.global_transform.basis != Basis(targetRot):
        turnTurrets(delta)

func set_new_angle(camAngle:Quat):
    targetRot = camAngle
    currentRot = self.global_transform.basis.get_rotation_quat()

func turnTurrets(delta):
    weight += 0.1
    var nextRot = currentRot.slerp(targetRot,weight)
    self.global_transform.basis = Basis(nextRot)
    if weight >= 1.0:
        weight = 0.0

    #self.global_transform.basis = Basis(targetRot).orthonormalized()
    #i'm stuck here.
    #Prolem: how do i take the global Quat and use it to rotate this oject?
