extends Area2D

var puntos:int = 10
var move:Vector2
var randx:int
var randy:int
var vida:int

func _ready():
	
	randx = randi()%2
	randy = randi()%2
	if(randx):
		position.x = get_viewport_rect().get_center().x *2 
		move.x = get_viewport_rect().get_center().x *-30000 + (randi()%200-100)
	else:
		position.x += get_viewport_rect().get_center().x - 600
		move.x = get_viewport_rect().get_center().x *30000 + (randi()%200-100)
	
	if(randy):
		position.y = get_viewport_rect().get_center().y *2
		move.y = get_viewport_rect().get_center().y *-30000 + (randi()%200-100)
	else:
		position.y += get_viewport_rect().get_center().x - 300
		move.y = get_viewport_rect().get_center().y *30000 + (randi()%200-100)
	
	
	puntos = puntos * ((randi() % 11)+1)
	scale.x = 1+(float(puntos)/100)
	scale.y = 1+(float(puntos)/100)
	
	vida = 10* puntos



func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("jugador"):
		body.SubirPuntos(puntos)
		queue_free()

func _process(delta: float) -> void:
	rotation_degrees += puntos/2
	vida -= 2
	position.x = position.move_toward(move,puntos/10).x
	position.y = position.move_toward(move,puntos/10).y
