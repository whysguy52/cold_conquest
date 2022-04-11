extends Spatial

var role

var laserSpawn

var gunCast = RayCast
var defaultTarget
var base
var pivot
var ship
var shipRoot

# Called when the node enters the scene tree for the first time.
func _ready():
  role = NetworkManager.myPlayerData["role"]
  shipRoot = get_parent().get_parent().get_parent()
  #Gun objects - ray cast (to match direction), base and pivot
  gunCast = shipRoot.get_node("GunnerControls/CameraOrbit/CameraNod/Camera/RayCast")
  defaultTarget = shipRoot.get_node("GunnerControls/CameraOrbit/CameraNod/Camera/TargetPoint")
  base = get_node("Base")
  pivot = get_node("Base/PivotPoint")
  ship = shipRoot.get_node("ShipBody")
  
  #laser for shooting
  laserSpawn = $Base/PivotPoint/LaserSpawn


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
  if role != "gunner":
    return
  follow_camera()
  
  if Input.is_action_just_pressed("LMB"):
    laserSpawn.fire()

func follow_camera():
  base.global_transform = base.global_transform.looking_at(defaultTarget.global_transform.origin,Vector3(0,1,0))
  base.rotation_degrees.z = 0
  base.rotation_degrees.x = 0
  base.global_transform = base.global_transform.orthonormalized()
  
  pivot.global_transform = pivot.global_transform.looking_at(defaultTarget.global_transform.origin,Vector3(0,1,0))
  pivot.rotation_degrees.y = 0
  pivot.global_transform = pivot.global_transform.orthonormalized()
  
  #print(ship.transform.y)
  rpc("remote_turret_turn",base.global_transform, pivot.global_transform)

remote func remote_turret_turn(baseTransform, pivotTransform):
  base.global_transform = baseTransform
  pivot.global_transform = pivotTransform
