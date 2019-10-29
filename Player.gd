extends Node2D

var Bullet = preload("res://Bullet.tscn")
var can_shoot = true
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move()
	if can_shoot:
		shoot()

func move():
	if Input.is_action_just_pressed("ui_left"):
		position.x -= 32
	if Input.is_action_just_pressed("ui_right"):
		position.x += 32
	if position.x < 16:
		position.x = 272
	if position.x > 272:
		position.x = 16
		
func shoot():
	if Input.is_action_pressed("ui_select"):
		var bullet = Bullet.instance()
		bullet.position = global_position
		get_parent().add_child(bullet)
		can_shoot = false

func _on_Timer_timeout():
	can_shoot = true
