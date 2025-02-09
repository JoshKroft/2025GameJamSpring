extends State
class_name CrazyExFollow

@export var CrazyEx : CharacterBody2D
@export var move_speed := 40.0
var player : CharacterBody2D

func Enter():
	player = get_tree().get_first_node_in_group("Player")

func Physics_Update(delta: float):
	var direction = player.global_position - CrazyEx.global_position
	
	if direction.length() > 25:
		CrazyEx.velocity = direction.normalized() * move_speed
	else:
		CrazyEx.velocity = Vector2() 

	if direction.length() > 50:
		Transitioned.emit(self, "idle")
	
