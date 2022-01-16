extends ColorRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func flash(flash_color, number_of_times, step):
	pass
	var color = get_frame_color()
	for i in range(number_of_times):
		
		if i % 2 == 0:
			
			set_frame_color(flash_color)
		else:
			set_frame_color(color)
		yield(get_tree().create_timer(step), "timeout")	
		
	

