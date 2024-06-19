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
		var angle = joystick.global_position.angle_to_point(get_global_mouse_position())
		if get_global_mouse_position().distance_to(joystick.global_position) <= diameter:
			global_position = get_global_mouse_position()
			direction(angle)
		else:
			global_position.x = joystick.global_position.x + (cos(angle)*diameter)
			global_position.y = joystick.global_position.y + (sin(angle)*diameter)
			direction(angle)
	else:
		global_position = joystick.global_position
		joystick.direction = Vector2.ZERO

func direction(input_Angle):
	var angle = input_Angle
	#X_DIRECTION
	if angle < 0.95 and angle > -0.95:
		if (global_position.x - joystick.global_position.x) >= deadZone:
			joystick.direction.x = 1
	elif angle > 2.2 or angle < -2.2:
		if (global_position.x - joystick.global_position.x) <= -deadZone:
			joystick.direction.x = -1
	else :
		joystick.direction.x = 0
	
	#Y_DIRECTION
	if angle > 0.6 and angle < 2.5:
		if (global_position.y - joystick.global_position.y) >= deadZone:
			joystick.direction.y = 1
	elif angle < -0.6 and angle > -2.5:
		if (global_position.y - joystick.global_position.y) <= -deadZone:
			joystick.direction.y = -1
	else :
		joystick.direction.y = 0


func _on_button_button_down():
	pressing = true


func _on_button_button_up():
	pressing = false
