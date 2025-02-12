extends CharacterBody2D
class_name Player

@export var move_speed : float = 100
var hearts_list : Array[TextureRect]
var health = 3
var alive : bool = true

func _ready() -> void:
	var hearts_parent = $health_bar/HBoxContainer
	for child in hearts_parent.get_children():
		hearts_list.append(child)
	print(hearts_list)

func _physics_process(delta: float) -> void:
	var input_direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)

	#input velocity 
	velocity = input_direction * move_speed 
	move_and_slide()
	
func take_damage():
	if health > 0:
		if $InvulnerabilityTimer.is_stopped():
			modulate.a = 0.5
			health -= 1
			$InvulnerabilityTimer.start();
			update_heart_display()
			
		
func _on_player_timer_timeout() -> void:
	modulate.a = 1

func update_heart_display():
	for i in range(hearts_list.size()):
		hearts_list[i].visible = 1 < health
		
	# player dead
	if health <= 0:
		alive = false
	
func game_over():
	get_tree().reload_current_scene()
