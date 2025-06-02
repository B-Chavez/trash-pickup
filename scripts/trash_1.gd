extends RigidBody2D

@export var trash_texture: Texture #assigns the texture in the attached node to trash_texture

signal picked_up(item_type)

@export var item_type = globals.TrashType.WATERBOTTLE #Default to waterbottle (you can change it in the inspector)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("collectible")
	if trash_texture:
		$Sprite2D.texture = trash_texture
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_picked_up() -> void:
	print("I ", globals.TrashType, " was picked up.") #print out what was picked up and when
	emit_signal("picked_up", item_type) #emit the signal and pass the item name
