extends Node2D

# Cake Declarations
@onready var strawberrySlice = $strawberry_area 
@onready var redVelvetSlice = $red_velvet_area    

func _ready():
	# Connecting input event signals to handle clicks
	strawberrySlice.connect("input_event", Callable(self, "_on_strawberry_area_input_event"))
	redVelvetSlice.connect("input_event", Callable(self, "_on_red_velvet_area_input_event"))


# Test functions
# Functions will be later needed for moving the items onto a counter, or seeing amount left
# Function will need to be modified so cakes are generated from cooking event

func _on_strawberry_area_input_event(_viewport: Node, _event: InputEvent, _shape_idx: int) -> void:
	if _event is InputEventMouseButton and _event.pressed:
		print("Strawberry Cake Clicked!")

func _on_red_velvet_area_input_event(_viewport: Node, _event: InputEvent, _shape_idx: int) -> void:
	if _event is InputEventMouseButton and _event.pressed:
		print("Red Velvet Cake Clicked!")
