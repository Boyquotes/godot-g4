extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocity
var speed
var entering
# Called when the node enters the scene tree for the first time.
func _ready():
	speed = 16
	entering = false
	velocity = Vector2(-1,0)
	pass # Replace with function body.

func _physics_process(delta):
	if entering:
		move_and_slide(velocity * speed/4)
	else:
		ai_play()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func ai_play():
	pass

func _on_PongBall_glow_started(ball_position):
	yield(get_tree().create_timer(0.5), "timeout")
	entering=true


func _on_PongBall_glow_ended():
	entering=false
