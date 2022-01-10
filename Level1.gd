extends Node2D
signal please_shake_the_screen

var ball
var hole
signal ball_in_hole
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	ball = $PongBall
	hole = $BallMagicSpot
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if hole.overlaps_body(ball):
		emit_signal("ball_in_hole")
#	pass



func _on_Player_may_construct_pong_court():
	emit_signal("please_shake_the_screen")
	#make_ball_shine()
	#adjust_ball_position_and_rotation()
	#lift_up_the_ball_drawing_the_net()
	#disappear_the_ball()
	#enter_enemy()
	#appear_the_score_board()
	#appear_the_ball()
	#start_the_game()
	pass # Replace with function body.


func _on_Level1_please_shake_the_screen():
	pass # Replace with function body.


func _on_Level1_ball_in_hole():
	pass # Replace with function body.
