extends Sprite2D

#VARIABLES
@onready var joystick = $".."
var pressing = false
var diameter = 80
var deadZone = 8

func _ready():
	#DIAMETER
	diameter = diameter * joystick.scale.x

func _process(delta):
	#JOYSTICK
	if pressing:
		if get_global_mouse_position().distance_to(joystick.global_position) <= diameter:
			global_position = get_global_mouse_position()
			direction()
		else:
			var angle = joystick.global_position.angle_to_point(get_global_mouse_position())
			global_position.x = joystick.global_position.x + (cos(angle)*diameter)
			global_position.y = joystick.global_position.y + (sin(angle)*diameter)
			direction()
	else:
		global_position = joystick.global_position
		joystick.direction = Vector2.ZERO

func direction():
	#X_DIRECTION
	if position.y < 75 and position.y > -75:
		if (global_position.x - joystick.global_position.x) >= deadZone:
			joystick.direction.x = 1
		elif (global_position.x - joystick.global_position.x) <= -deadZone:
			joystick.direction.x = -1
	else :
		joystick.direction.x = 0
	
	#Y_DIRECTION
	if position.x < 75 and position.x > -75:
		if (global_position.y - joystick.global_position.y) >= deadZone:
			joystick.direction.y = 1
		elif (global_position.y - joystick.global_position.y) <= -deadZone:
			joystick.direction.y = -1
	else :
		joystick.direction.y = 0


func _on_button_button_down():
	pressing = true


func _on_button_button_up():
	pressing = false
