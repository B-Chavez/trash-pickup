extends CharacterBody2D

const SPEED = 300.0

@export var inventory = []

var pickup_range = 50 #Distance within which the player can pick up items

func _ready() -> void:
	print("Connecting to trash objects...")
	#Connect to the "picked_up" signal from the trash objects
	for trash in get_tree().get_nodes_in_group("collectible"):
		trash.connect("picked_up", Callable(self, "_on_trash_picked_up"))
	print("Connections made!")
		
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact"):
		for trash in get_tree().get_nodes_in_group("collectible"): #create a variable to use for iteration over the group of nodes called "collectible"
			if position.distance_to(trash.position) <= pickup_range: #if the positon of player node is less than the pickup range to one of the pieces of trash then run this
				trash._on_picked_up() # Call the method to emit the signal
				
				trash.queue_free() #Remove item from the scene

func _physics_process(delta: float) -> void:
	var direction = Vector2.ZERO #Start with no movement
	
	#Check for input in each direction
	if Input.is_action_pressed("moveUp"):
		direction.y -= 1
	if Input.is_action_pressed("moveDown"):
		direction.y += 1
	if Input.is_action_pressed("moveRight"):
		direction.x += 1
	if Input.is_action_pressed("moveLeft"):
		direction.x -= 1

	#Nomralize the direction vector to ensure consistent movement speed
	direction = direction.normalized()
	
	#Set velocity based on the input direction
	velocity = direction * SPEED
	
	#aply the movement using move_and_slide()
	move_and_slide()

func add_to_inventory(item_name: String) -> void:
		inventory.append(item_name)
		print("Added to inventory: ", item_name)
		pass

func _on_trash_picked_up(item_name:String) -> void:
	inventory.append(item_name) #Add the item to the inventory
	print("Picked up: ", item_name)
