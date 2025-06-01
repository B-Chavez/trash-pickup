extends CharacterBody2D

const SPEED = 300.0


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
