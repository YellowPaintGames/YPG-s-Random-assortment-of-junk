extends CharacterBody2D

@export var center: Node2D
@export var radius := 100.0
@export var angular_speed := 1.5

var angle := 0.0

func _physics_process(delta):
	angle += angular_speed * delta

	global_position = center.global_position + Vector2(
		cos(angle),
		sin(angle)
	) * radius
