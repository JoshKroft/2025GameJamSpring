extends CharacterBody2D
class_name Player

@export var move_speed : float = 100
var hearts_list : Array[TextureRect]
var health = 3
var can_take_damage = true
var alive : bool = true

func _ready() -> void:
	var hearts_parent = $health_bar/HBoxContainer
	for i in hearts_parent.get_children():
		hearts_list.append(i)
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
	if $InvulnerabilityTimer.is_stopped():	
		if health > 0:
			if can_take_damage == true:
				modulate.a = 0.5
				health -= 1
				$InvulnerabilityTimer.start();
				can_take_damage = false
				update_heart_display()
			
		
func _on_player_timer_timeout() -> void:
	modulate.a = 1
	can_take_damage = true
	

func update_heart_display():
	for i in range(hearts_list.size()):
		hearts_list[i].visible = i < health
		
	# player dead
	if health <= 0:
		alive = false
		game_over()
	
func game_over():
	if alive == false:
		get_tree().change_scene_to_file("res://Menus/GameOverScreen.tscn")


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		get_tree().change_scene_to_file("res://Menus/WinMenu.tscn")
	
