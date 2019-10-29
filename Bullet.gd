extends Area2D

var direction = "down"
var speed = 256
var self_destruct_time = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	var random_candy = randi() % 4
	if random_candy <= 1:
		$Sprite.visible = true
	elif random_candy <= 2:
		$Sprite2.visible = true
	elif random_candy <= 3:
		$Sprite3.visible = true
	$Timer.start(self_destruct_time)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if direction == "up":
		position.y -= speed * delta
		return
	if direction == "down":
		position.y += speed * delta
		return
	if direction == "left":
		position.x -= speed * delta
		return
	if direction == "right":
		position.x += speed * delta
		return


func _on_Timer_timeout():
	queue_free()
