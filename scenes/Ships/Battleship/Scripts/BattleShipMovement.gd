extends KinematicBody


var shipPosition
var role
var maxSpeed = 5
var currentSpeed = 0
var ThrusterHUDSlider
var warpFactor


# Called when the node enters the scene tree for the first time.
func _ready():
  role = NetworkManager.myPlayerData["role"]
  shipPosition = $ShipBody
  ThrusterHUDSlider = get_node("PilotHud/Panel/ThrusterSlider")

func _physics_process(delta):
  if role != "pilot":
    return
  move_ship_forward(delta)

func move_ship_forward(delta):
  move_and_slide(shipPosition.transform.basis.x.normalized() * currentSpeed)

func speed_up():
  currentSpeed += 0.05
  update_thruster_slider()

func speed_down():
  currentSpeed -= 0.05
  update_thruster_slider()

func update_thruster_slider():
  currentSpeed = clamp(currentSpeed, -0.5, 5)
  ThrusterHUDSlider.value = currentSpeed / maxSpeed * 100 # this is to get a number between 0 and 100


func _on_ThrusterSlider_value_changed(value):
  currentSpeed = value / 100 * 5 
