extends Spatial


var Cannons
var ShipBody

# Called when the node enters the scene tree for the first time.
func _ready():
    ShipBody = get_parent()
    Cannons = get_children()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
    pass

func set_new_angle(camAngle:Quat):
    #rotate the axis by the cannons z axis angle and send it.
    # I don't know if this way is a good idea but it works.
    for cannon in Cannons:
      #CAUTION: rotation_degrees.z may cause issues
      var flippedQuat = rotate_basis_axis(camAngle,cannon.rotation_degrees.z)
      cannon = cannon.get_child(0)
      cannon.set_new_angle(flippedQuat)

#needs to be fixed
func rotate_basis_axis(camAngle,baseRot):
    #FIGURE OUT HOW TO ROTATE AROUND Z AND THEN REPLACE THIS
    var camAngleBasis = Basis(camAngle)
    var convertedQuat:Quat
    convertedQuat = camAngleBasis.rotated(camAngleBasis.z,baseRot)
    return Quat(convertedQuat)
