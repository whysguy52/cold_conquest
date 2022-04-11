extends Spatial
# This is the rotation node. Translate the parent node and rotate this one. 
var cameraNod
var pilot

var ShipOrientationV3
var CameraOrientationV3

var ShipOrientationQuat
var CameraOrientationQuat

var stepTowardsCamera
var turnRate = 0.01

var isDoneRotating = true

# Called when the node enters the scene tree for the first time.
func _ready():
  cameraNod = get_parent().get_node("PilotControls/CameraNod")
  pilot = get_parent().get_node("PilotControls")
  

func turn_ship(isUpdating, orientationLocked):
  
  if orientationLocked == true:
    quat_turn(isUpdating)
  else:
    vect_turn(isUpdating)
  rpc("remote_turn_ship",transform)

remote func remote_turn_ship(shipTransform):
  transform = shipTransform

func roll_ship():
  var rotationAmmount = int(Input.is_action_pressed("ui_roll_right")) - int(Input.is_action_pressed("ui_roll_left"))
  transform.basis = transform.basis.slerp(transform.basis.rotated(transform.basis.x, rotationAmmount), turnRate)
  transform.basis.orthonormalized()

func slerp(va : Vector3, vb : Vector3, p_t : float):
  var theta = va.angle_to(vb)
  if va.cross(vb) == Vector3(0,0,0):
    #This is correct for parallel vectors but will not work for anti-parallel vectors
    #I should look into a way of randomely generating a perpendicular vector for rotation.
    return va 
  return va.rotated(va.cross(vb).normalized(), theta * p_t)

func vect_turn(isUpdating):
  ShipOrientationV3 = global_transform.basis.x.normalized()
  if isUpdating:
    CameraOrientationV3 = cameraNod.global_transform.basis.x.normalized()
    CameraOrientationQuat = Quat(cameraNod.global_transform.basis.orthonormalized())
  ShipOrientationV3 = slerp(ShipOrientationV3, CameraOrientationV3,turnRate)
  
  global_transform.basis.x = ShipOrientationV3
  global_transform.basis = transform.basis.orthonormalized()
  
  var quatDiff = CameraOrientationV3.dot(ShipOrientationV3)
  if quatDiff > 0.9999:
    pilot.isDoneRotating = true

func quat_turn(isUpdating):
  ShipOrientationQuat = Quat(transform.basis)
  if isUpdating:
    CameraOrientationQuat = Quat(cameraNod.global_transform.basis.orthonormalized())
    CameraOrientationV3 = cameraNod.global_transform.basis.x.normalized()
  stepTowardsCamera = ShipOrientationQuat.slerp(CameraOrientationQuat,0.01)
  transform.basis = Basis(stepTowardsCamera)
  transform.basis = transform.basis.orthonormalized()
  
  
  var quatDiff = CameraOrientationQuat.dot(ShipOrientationQuat)
  if quatDiff > 0.9999:
    pilot.isDoneRotating = true
