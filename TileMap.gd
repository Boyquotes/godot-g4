extends TileMap

const SHAKE_TIME = 100

var shake_mode
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	shake_mode=false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if shake_mode:
		shake_me(delta)
#	pass


func _on_Level1_please_shake_the_screen():
	shake_mode=true
	pass # Replace with function body.


func shake_me(delta):
	shake_mode=false
	var shake_time = SHAKE_TIME
	while shake_time > 0:
		if Engine.get_frames_drawn()%45==0:
			if Engine.get_frames_drawn() % 2==0:
				position.y += 1
			else:
				position.y -= 1
				
				
