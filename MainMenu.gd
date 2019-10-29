extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/HighScore.text = str(Global.high_score)
	$VBoxContainer/Score.text = str(Global.current_score)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	Global.reset()
	get_tree().change_scene("res://Main.tscn")
