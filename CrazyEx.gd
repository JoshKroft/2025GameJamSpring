extends CharacterBody2D
class_name CrazyEx

const speed = 75
@export var player: CharacterBody2D

@onready var nav_agent := $NavigationAgent2D as NavigationAgent2D

func _ready() -> void:
	player = get_tree().get_first_node_in_group("Player")
	makepath()

func _physics_process(_delta: float) -> void:
	var dir = to_local(nav_agent.get_next_path_position()).normalized()
	velocity = dir * speed
<<<<<<< HEAD:CrazyEx.gd
=======
	
	if velocity == Vector2.ZERO:
		animation.play("Idle")
	elif velocity.x < 0:
		$Sprite.flip_h = true
		animation.play("Walk")
	else:
		$Sprite.flip_h = false
		animation.play("Walk")
		
	
>>>>>>> parent of 7bf95f0 (AlrightImDone):Character Scripts/CrazyEx.gd
	move_and_slide()

func makepath() -> void:
	nav_agent.target_position = player.global_position

func _on_timer_timeout() -> void:
	makepath()

func _on_hurtbox_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		body.take_damage()
