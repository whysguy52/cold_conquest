extends Spatial


var PivotPoint
var targetRot:Basis
var updatedRot:Basis
var currentBaseRot:Basis
var currentPivotRot:Basis
var weight = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
    PivotPoint = $Body/PivotPoint
#    currentBaseRot = transform.basis.get_rotation_quat()
#    currentPivotRot = PivotPoint.transform.basis.get_rotation_quat()

func _process(_delta):
    pass

func _physics_process(delta):
    if updatedRot.z != targetRot.z:
        weight = delta
        targetRot = updatedRot
        
    if weight <= 1.0:
        turnTurrets(delta)

func set_new_angle(camAngle:Basis):
    if camAngle.z == updatedRot.z:
        return
    updatedRot = camAngle
    currentBaseRot = global_transform.basis.orthonormalized()
    currentPivotRot = PivotPoint.global_transform.basis.orthonormalized()

func turnTurrets(delta):
    turnBase()
    turnPivot()
    weight += delta * 0.5

func turnBase():
    #calculate weighted slerp for base and store it
    var nextBaseRot = currentBaseRot.slerp(targetRot.orthonormalized(),weight)
    
    #assign the next weighted basis to current basis
    global_transform.basis = nextBaseRot
    
    #lock base rotation to only y.
#    self.rotation_degrees.x = 0
#    self.rotation_degrees.z = 0

func turnPivot():
    
    var nextPivotRot = currentPivotRot.slerp(targetRot.orthonormalized(),weight)
    
    PivotPoint.global_transform.basis = nextPivotRot
    
    #lock pivot rotation to only x
#    PivotPoint.rotation_degrees.z = 0
#    PivotPoint.rotation_degrees.y = 0
#
#    PivotPoint.rotation_degrees.x = clamp(PivotPoint.rotation_degrees.x,0,90)
