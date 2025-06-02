extends CharacterBody2D

const SPEED = 300.0

@export var inventory = []
@export var inventory_offset := Vector2(0, -50) #How far above the player the inventory is

var pickup_range = 50 #Distance within which the player can pick up items

var isInvOpen = false

func _ready() -> void:
	pass
		
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact"):
		for trash in get_tree().get_nodes_in_group("collectible"): #create a variable to use for iteration over the group of nodes called "collectible"
			if position.distance_to(trash.position) <= pickup_range : #if the positon of player node is less than the pickup range to one of the pieces of trash then run this
				get_parent().remove_child(trash) #Remove item from the scene
				
				trash.remove_from_group("collectible") #remove the current piece of trash picked up from the group collectible
				
				#Remove CollsionShape2D from trash node
				if trash.has_node("CollisionShape2D"):
					trash.get_node("CollisionShape2D").queue_free()
				
				#Figure out a new name based on its item_type
				var type_int = trash.item_type #this will be an int we're assigning to type_int
				var base_name =  globals.TrashTypeName[type_int] #e.g. This should call for something like WATERBOTTLE
				
				#Give it a unique numeric suffix
				var inv_node = get_node("/root/Inventory")
				var suffix = str(inv_node.get_child_count() + 1) #Get the amount of children from the inventory node and add 1 then assign it to the suffix var
				trash.name = "%s%s" % [base_name, suffix] #assign the trash node name something like WATERBOTTLE1
				
				#Add to inventory
				inv_node.add_child(trash)
				
				#print entire tree of Inventory to console
				print("---- Inventory now contains: ----")
				for child in inv_node.get_children():
					print(" • ", child.name)
				print("--------------------")
				
				break
	if Input.is_action_just_pressed("opencloseInventory"):
		open_inventory()

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

func _on_trash_picked_up(item_type: int) -> void:
	var trash_name
	print("Picked up trash type: ", item_type)
	inventory.append(trash_name) #Add the item to the inventory
	print("Current Inventory: ", inventory)

func open_inventory():
	var inv = get_node("/root/Inventory")
	var playerPosition = get_node(".")
	if isInvOpen:
		inv.visible = false
		isInvOpen = false
		print("Inventory is closed")
	else:
		inv.visible = true
		isInvOpen = true
		print("Inventory is open")
		
		#Compute players golbal position
		inv.global_position = playerPosition.global_position + inventory_offset
			
