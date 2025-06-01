extends RigidBody2D

var trash_texture: Texture #assigns the texture in the attached node to trash_texture

signal picked_up(item_name)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if trash_texture:
		$Sprite2D.texture = trash_texture
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_picked_up() -> void:
	print("Picked up: ", name) #print out what was picked up and when
	emit_signal("picked_up", name) #emit the signal and pass the item name
