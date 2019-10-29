extends Node2D

var Block = preload("res://Block.tscn")
var Bullet = preload("res://Bullet.tscn")
var Score = preload("res://Score.tscn")

var spawn_positions
var previous_pos = Vector2.ZERO

func _ready():
	spawn_positions = PoolVector2Array([Vector2(16,  global_position.y)])
	for i in range (9):
		spawn_positions.append(Vector2(32 * i + 16, global_position.y))

func spawn_block(pos : Vector2):
	var block = Block.instance()
	block.position = pos
	block.connect("destroyed", self, "_on_Block_destroyed")
	get_parent().add_child(block)

func spawn_bullets(pos):
	spawn_bullet("up", 0.2, pos)
	spawn_bullet("down", 0.2, pos)
	spawn_bullet("left", 0.2, pos)
	spawn_bullet("right", 0.2, pos)
	var score = 10 * Global.score_koef
	var score_txt = Score.instance()
	score_txt.score = score
	score_txt.position = pos
	get_parent().add_child(score_txt)
	Global.add_score(score)
	Global.score_koef += 1
	$ComboTimer.start(0.2)

func spawn_bullet(dir : String, self_destruct : float, pos : Vector2):
	var bullet = Bullet.instance()
	bullet.position = pos
	bullet.direction = dir
	bullet.self_destruct_time = self_destruct
	get_parent().add_child(bullet)
	
func _on_Timer_timeout():
	var random_range = randi() % 10
	for i in range(random_range):
		var random_pos = spawn_positions[randi() % spawn_positions.size()]
		if previous_pos != random_pos:
			spawn_block(random_pos)
	$Timer.start(1 - Global.level / 5)

func _on_Block_destroyed(pos):
	call_deferred("spawn_bullets", pos)

func _on_ComboTimer_timeout():
	Global.score_koef = 1
