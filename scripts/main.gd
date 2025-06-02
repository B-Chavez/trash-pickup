extends Node2D

var trash_scene = preload("res://scenes/trash_1.tscn") #preload the trash scene


#Coords and sizes of each trash sprite based on the Auto Slice under Edit Region
var trash_types = [
	{"type": globals.TrashType.WATERBOTTLE, "x":2.0, "y":17.0, "width":15.0, "height":45.0}, #trash item
	{"type": globals.TrashType.MILKGALLON, "x":19.0, "y":7.0, "width":39.0, "height":55.0}, #trash item
	{"type": globals.TrashType.DETERGENT, "x":60.0, "y":18.0, "width":36.0, "height":44.0}, #trash item
	{"type": globals.TrashType.BOX, "x":98.0, "y":14.0, "width":51.0, "height":48.0}, #trash item
	{"type": globals.TrashType.NEWSPAPER, "x":151.0, "y":34.0, "width":53.0, "height":28.0}, #trash item
	{"type": globals.TrashType.PAPERBAG, "x":206.0, "y":16.0, "width":35.0, "height":46.0}, #trash item
	{"type": globals.TrashType.COKEBOTTLE, "x":243.0, "y":12.0, "width":17.0, "height":50.0}, #trash item
	{"type": globals.TrashType.JAR, "x":262.0, "y":27.0, "width":23.0, "height":35.0}, #trash item
	{"type": globals.TrashType.BEERBOTTLE, "x":287.0, "y":13.0, "width":16.0, "height":49.0}, #trash item
	{"type": globals.TrashType.SMALLCAN, "x":305.0, "y":32.0, "width":23.0, "height":30.0}, #trash item
	{"type": globals.TrashType.LARGECAN, "x":330.0, "y":22.0, "width":21.0, "height":40.0}, #trash item
	{"type": globals.TrashType.COKECAN, "x":353.0, "y":28.0, "width":18.0, "height":34.0}, #trash item
	{"type": globals.TrashType.DRINK, "x":373.0, "y":17.0, "width":28.0, "height":45.0}, #trash item
	{"type": globals.TrashType.PIZZABOX, "x":403.0, "y":32.0, "width":60.0, "height":30.0}, #trash item
	{"type": globals.TrashType.MUG, "x":465.0, "y":36.0, "width":29.0, "height":26.0}, #trash item
	{"type": globals.TrashType.SPRAYCAN, "x":496.0, "y":17.0, "width":17.0, "height":40.0}, #trash item
	
]

var pickup_range:= 50 #Distance that the trash needs to be within to be picked up

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(10): #This loops the code 10 times, creating 10 pieces of trash
		var trash_instance = trash_scene.instantiate() #Create an instance of the trash scene
		trash_instance.trash_texture = preload("res://assets/recycle_items.png") #add the texture png to trash_texture thats in the trash_1 scene
		
		#Randomly pick the trash item
		var random_trash = trash_types[randi() % trash_types.size()]
		
		#Set region of the sprite based on the random trash item
		trash_instance.get_node("Sprite2D").region_rect = Rect2(random_trash["x"], random_trash["y"], random_trash["width"], random_trash["height"])
		
		#Set the item type for this trash instance (pass TrashType enum)
		trash_instance.item_type = random_trash["type"]
		
		add_child(trash_instance) # Add the trash to scene
		
		# Randomize the postion of the trash
		trash_instance.position = Vector2(randf_range(0, 800), randf_range(0, 600))
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
