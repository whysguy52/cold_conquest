extends Spatial


var Cannons


# Called when the node enters the scene tree for the first time.
func _ready():
    Cannons = get_children()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    for cannon in Cannons:
        cannon = cannon.get_child(0)
        cannon.turn(1*delta)
        cannon.traverse(1*delta)
