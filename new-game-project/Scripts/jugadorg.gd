extends CharacterBody2D


const SPEED:float = 300.0



func SubirPuntos(pts:int): 
	$Label.text = str(int($Label.text) + pts)


func _physics_process(delta: float) -> void:
	$Blackhole.rotation_degrees += 100
	$Label.position.y = -500
	
	
	
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	direction = Input.get_axis("ui_up", "ui_down")
	if direction:
		velocity.y = direction * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	
	
	move_and_slide()
