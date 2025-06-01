extends RigidBody2D

var trash_texture: Texture #assigns the texture in the attached node to trash_texture

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if trash_texture:
		$Sprite2D.texture = trash_texture
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
