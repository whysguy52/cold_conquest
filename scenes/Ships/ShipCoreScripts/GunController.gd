extends Spatial


var Cannons


# Called when the node enters the scene tree for the first time.
func _ready():
    Cannons = get_children()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
    pass


func set_new_angle(camAngle:Basis):
    #rotate the axis by the cannons z axis angle and send it.
    # I don't know if this way is a good idea but it works.
    for cannon in Cannons:
      #CAUTION: rotation_degrees.z may cause issues
      var flippedBasis = rotate_basis_axis(camAngle,cannon.rotation_degrees.z)
      cannon = cannon.get_child(0)
      cannon.set_new_angle(flippedBasis)

#needs to be fixed
func rotate_basis_axis(camAngle,baseRot):
    var convertedBasis:Basis
    convertedBasis = camAngle.rotated(camAngle.z,baseRot)
    return convertedBasis
