extends Node

#Declare TrashType so all scripts can use it
enum	TrashType {WATERBOTTLE, MILKGALLON, DETERGENT, BOX, NEWSPAPER, PAPERBAG, COKEBOTTLE, JAR, BEERBOTTLE, SMALLCAN, LARGECAN, COKECAN, DRINK, PIZZABOX, MUG, SPRAYCAN}

#Build a reverse map at the startup so we can go from int to string:
var TrashTypeName : Dictionary = {}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for key in TrashType.keys(): #Interate over TrashType.keys()
		var val = TrashType[key] #Assign each specific TrashType to the temporary variable val
		TrashTypeName[val] = key #Drop the key from the for loop into TrashTypeName[0], e.g. TrashTypeName[0] = "WATERBOTTLE"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
