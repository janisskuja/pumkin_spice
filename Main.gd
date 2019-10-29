extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.level += 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_area_entered(area):
	if area.is_in_group("block"):
		Global.game_over()
		get_tree().change_scene("res://MainMenu.tscn")

func _on_Timer_timeout():
	Global.level += 1
