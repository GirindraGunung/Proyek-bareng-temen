extends CharacterBody2D

#VARIABLES
var speed = 300
@onready var animation = $animation
@onready var hitbox = $hitbox



#MOVEMENT
func _physics_process(delta):
	var input = Vector2(Input.get_axis("left", "right"), Input.get_axis("up", "down"))
	velocity = speed*input
	#ANIMATION
	if velocity.x or velocity.y != 0:
		if velocity.x < 0:
			animation.flip_h = true
			animation.play("walk")
			#HITBOX_SET
			hitbox.position.x = -1.5
		else:
			animation.flip_h = false
			animation.play("walk")
			#HITBOX_SET
			hitbox.position.x = 1.5
	else:
		animation.play("idle")
	print(hitbox.position.x)
	move_and_slide()
