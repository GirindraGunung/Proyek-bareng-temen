extends Node2D

var player_Res = preload("res://Scenes/player.tscn")
@onready var spawn_pos = $spawn_Pos

# Called when the node enters the scene tree for the first time.
func _ready():
	var player = player_Res.instantiate()
	add_child(player)
	player.global_position = spawn_pos.global_position

