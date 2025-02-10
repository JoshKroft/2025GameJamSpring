extends CharacterBody2D
class_name CrazyEx

const speed = 50
@export var player: CharacterBody2D

@onready var nav_agent := $NavigationAgent2D as NavigationAgent2D

func _ready() -> void:
	player = get_tree().get_first_node_in_group("Player")
	makepath()

func _physics_process(_delta: float) -> void:
	var dir = to_local(nav_agent.get_next_path_position()).normalized()
	velocity = dir * speed
	move_and_slide()

func makepath() -> void:
	nav_agent.target_position = player.global_position

func _on_timer_timeout() -> void:
	makepath()
