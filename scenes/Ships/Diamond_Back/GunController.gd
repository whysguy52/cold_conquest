extends Spatial


var Cannons
var t = 0.0


# Called when the node enters the scene tree for the first time.
func _ready():
    Cannons = get_children()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass

#  $Sprite.position = $A.position.linear_interpolate($B.position, t)

func set_new_angle(camAngle:Quat):
    for cannon in Cannons:
        cannon = cannon.get_child(0)
        cannon.set_new_angle(camAngle)
