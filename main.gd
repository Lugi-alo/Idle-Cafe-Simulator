extends Node2D

@onready var ovenArea = $oven_area
@onready var strawberrySlice = preload("res://assets/strawberry slice.png")  

func _ready():
	ovenArea.connect("input_event", Callable(self, "_on_oven_area_input_event"))

# Function altered to generate cake items.
# Needs to be changed to allow users to pick from a selection
func _on_oven_area_input_event(_viewport: Node, _event: InputEvent, _shape_idx: int) -> void:
	if _event is InputEventMouseButton and _event.pressed:
		# Debug statement
		print("Oven Clicked! Starting to make a strawberry cake...")
		start_cooking("Strawberry Cake")

# Needs to eventually display timer above the oven
func start_cooking(cake_name: String) -> void:
	# Debug statement
	print("Starting countdown as 5 seconds...")
	var cooking_time = 5.0
	# Debug statement
	print("Cooking " + cake_name + " for " + str(cooking_time) + " seconds...")
	await get_tree().create_timer(cooking_time).timeout
	# Waits for countdown to end
	place_cake_on_oven(cake_name)
	
func place_cake_on_oven(cake_name: String) -> void:
	# Debug statement
	print("Strawberry cake is ready!")
	
	var cake_sprite = Sprite2D.new()
	cake_sprite.texture = strawberrySlice
	cake_sprite.position = ovenArea.position
	cake_sprite.z_index = 10
	add_child(cake_sprite)
	
	# Debug statement
	print(cake_name + " is ready and placed on the oven")
	
