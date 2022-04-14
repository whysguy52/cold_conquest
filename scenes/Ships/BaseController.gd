extends Spatial

var MOUSE_SENSITIVITY = 0.05

var CameraOrbit
var CameraNod

# Called when the node enters the scene tree for the first time.
func _ready():
    CameraOrbit = $CameraOrbit
    CameraNod = $CameraOrbit/CameraNod
    
    Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass

func _input(event):
  if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
    rotate_cam(event)


func rotate_cam(event):
  CameraOrbit.rotate_y(deg2rad(event.relative.x * MOUSE_SENSITIVITY * -1))
  CameraNod.rotate_x(deg2rad(event.relative.y * MOUSE_SENSITIVITY * -1))

