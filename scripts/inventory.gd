extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var Sprite2D_node = get_node("./Inventory").get_node("Sprite2D")
	var children_array = get_node("./Inventory").get_children()
	for child in children_array:
		if child.name != "Sprite2D":
			child.position = Sprite2D_node.position + 50
		
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
