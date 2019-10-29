extends Node2D

var speed = 32
var is_destructing = false

signal destroyed

func _ready():
	speed = speed * (Global.level / 2)
	
func _process(delta):
	position.y -= speed * delta


func _on_Block_area_entered(area):
	if area.is_in_group("bullet") and !is_destructing:
		is_destructing = true
		area.queue_free()
		queue_free()
		emit_signal("destroyed", global_position)
