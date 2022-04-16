extends Spatial


var PivotPoint
var targetRot:Quat
var currentBaseRot:Quat
var currentPivotRot:Quat
var weight = 1.1

# Called when the node enters the scene tree for the first time.
func _ready():
    PivotPoint = $Body/PivotPoint
#    currentBaseRot = transform.basis.get_rotation_quat()
#    currentPivotRot = PivotPoint.transform.basis.get_rotation_quat()

func _process(_delta):
    pass

func _physics_process(delta):
    if weight <= 1.0:
        turnTurrets(delta)

func set_new_angle(camAngle:Quat):
    targetRot = camAngle
    currentBaseRot = self.global_transform.basis.get_rotation_quat()
    currentPivotRot = PivotPoint.global_transform.basis.get_rotation_quat()
#    if get_parent().translation.y < 0:
#        currentBaseRot = currentPivotRot.inverse()
    weight = 0.05

func turnTurrets(_delta):
    
    weight += 0.05
    
    turnBase()
    turnPivot()

func turnBase():
    
    #calculate weighted slerp for base and store it
    var nextBaseRot = currentBaseRot.slerp(targetRot,weight)
    
    #assign the next weighted basis to current basis
    self.global_transform.basis = Basis(nextBaseRot)
    
    #lock base rotation to only y.
    self.rotation_degrees.x = 0
    self.rotation_degrees.z = 0

func turnPivot():
    
    var nextPivotRot = currentPivotRot.slerp(targetRot,weight)
    
    PivotPoint.global_transform.basis = Basis(nextPivotRot)
    
    #lock pivot rotation to only x
    PivotPoint.rotation_degrees.z = 0
    PivotPoint.rotation_degrees.y = 0
    
    PivotPoint.rotation_degrees.x = clamp(PivotPoint.rotation_degrees.x,0,90)
