extends Node2D

export(PackedScene) var l2

var ball
var hole
signal ball_in_hole

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$BallMagicSpot/Camera2D.make_current()
	ball = $PongBall
	hole = $BallMagicSpot
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if hole.overlaps_body(ball):
		emit_signal("ball_in_hole")
#	pass




func _on_Level1_ball_in_hole():
	$Backgroung.flash(Color.white, 100, 0.01)
	SceneChanger.change_scene_to(l2)
	pass # Replace with function body.
