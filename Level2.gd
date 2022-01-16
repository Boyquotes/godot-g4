extends Node2D
signal curtain_is_up
signal score_updated

var enemy_score
var player_score  
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var curtain
var curtain_up=false

# Called when the node enters the scene tree for the first time.
func _ready():
	enemy_score = 0
	player_score = 0
	curtain=$NetCurtain
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !curtain_up:
		curtain.margin_bottom = $PongBall.position.y-4
	if(curtain.margin_bottom < 520):
		curtain.hide()
		curtain_up=true
		emit_signal("curtain_is_up")
	pass


func _on_Level2_curtain_is_up():
	$PongBall.shine()
	pass # Replace with function body.


func _on_Ball_enemy_has_scored():
	enemy_score+=1
	emit_signal("score_updated")
	print("Enemy")
	pass # Replace with function body.


func _on_Ball_player_has_scored():
	player_score+=1
	emit_signal("score_updated")
	print("Player")
