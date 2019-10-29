extends Node

var score_koef = 1
var current_score = 0
var high_score = 0
var level = 1

func reset():
	level = 1
	score_koef = 1
	current_score = 0

func add_score(score):
	current_score += score

func game_over():
	if current_score > high_score:
		high_score = current_score
