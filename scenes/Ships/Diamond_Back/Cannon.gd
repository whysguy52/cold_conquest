extends Spatial


var PivotPoint


# Called when the node enters the scene tree for the first time.
func _ready():
    PivotPoint = $Body/PivotPoint


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass
func turn(degrees):
    rotate_y(degrees)
    

func traverse(degrees):
    PivotPoint.rotate_x(degrees)
