extends Spatial


var Cannons


# Called when the node enters the scene tree for the first time.
func _ready():
    Cannons = get_children()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
    pass


func set_new_angle(camAngle:Quat):
    
    for cannon in Cannons:
        if cannon.translation.y < 0:
            cannon = cannon.get_child(0)
            var flippedQuat = flip_quat(camAngle)
            cannon.set_new_angle(flippedQuat)
        else:
            cannon = cannon.get_child(0)
            cannon.set_new_angle(camAngle)

#needs to be fixed
func flip_quat(camAngle):
    var wValue = camAngle.w
    var zValue = camAngle.z
    
    camAngle.w = zValue
    camAngle.z = wValue
    return camAngle
