extends CharacterBody2D

#VARIABLES
var speed = 300

#MOVEMENT
func _physics_process(delta):
	var input = Vector2(Input.get_axis("left", "right"), Input.get_axis("up", "down"))
	velocity = speed*input
	move_and_slide()
