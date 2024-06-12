extends Node2D

#VARIABLES
var player_Res = preload("res://Scenes/player.tscn")
@onready var spawn_pos = $spawn_Pos

# Called when the node enters the scene tree for the first time.
func _ready():
	#PLAYER SET
	var player = player_Res.instantiate()
	add_child(player)
	player.global_position = spawn_pos.global_position

func _process(delta):
	#EXIT(sementara)
	if Input.is_action_just_pressed("pause"):
		get_tree().quit()
