extends Spatial


var Cannons


# Called when the node enters the scene tree for the first time.
func _ready():
    Cannons = get_children()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
    pass


func set_new_angle(camAngle:Basis):
    
    for cannon in Cannons:
        if cannon.translation.y < 0:
            var flippedBasis = flip_quat(camAngle)
            cannon = cannon.get_child(0)
            cannon.set_new_angle(flippedBasis)
        else:
            cannon = cannon.get_child(0)
            cannon.set_new_angle(camAngle)

#needs to be fixed
func flip_quat(camAngle):
    var convertedBasis:Basis
    convertedBasis = camAngle.rotated(camAngle.z,PI)
#    var newQuat = Quat(convertedBasis)
    return convertedBasis
