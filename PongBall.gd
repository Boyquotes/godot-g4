extends RigidBody2D
signal glow_started(ball_position)
signal glow_ended
signal can_replace_ball(ball_position)

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var glow

# Called when the node enters the scene tree for the first time.
func _ready():
	glow = $Sprite/AlphaGlow
	pass # Replace with function body.



func shine(var time=10):
	emit_signal("glow_started", position)
	while time>0:
		for i in range(100):
			$Sprite/AlphaGlow.modulate.a=i/100.0
			yield(get_tree().create_timer(0.005), "timeout")
			
		time-=1
		if time == 2:
			emit_signal("glow_ended")
		yield(get_tree().create_timer(0.005), "timeout")
	emit_signal("can_replace_ball", position)
	queue_free()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


