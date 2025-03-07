extends State
class_name CrazyExIdle

@export var CrazyEx : CharacterBody2D
@export var move_speed : float = 10.0

var player: CharacterBody2D

var move_direction : Vector2
var wander_time : float

func randomize_wander():
	move_direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
	wander_time = randf_range(1, 3)
	
func Enter():
	player = get_tree().get_first_node_in_group("Player")
	randomize_wander()
	
func Update(delta: float):
	if wander_time > 0:
		wander_time -= delta
	
	else:
		randomize_wander()

func Physics_Update(delta: float):
	if CrazyEx:
		CrazyEx.velocity = move_direction * move_speed
		
	var direction = player.global_position - CrazyEx.global_position

	if direction.length() < 500:
		Transitioned.emit(self, "follow")
