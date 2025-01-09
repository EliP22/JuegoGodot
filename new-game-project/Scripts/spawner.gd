extends Node2D

var AsteroideTscn = preload("res://Escenas/Asteroide.tscn") 

func _on_timer_timeout() -> void:
	var obj = AsteroideTscn.instantiate()
	add_child(obj)
