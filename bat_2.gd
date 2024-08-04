extends CharacterBody2D

@export var wander_direction : Node2D

func _physics_process(delta):
	velocity = wander_direction.direction * 20
	move_and_slide()

	$AnimatedSprite2D.play("idle")
	$AnimatedSprite2D.flip_h = true

func bat_2():
	pass
