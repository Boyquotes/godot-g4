extends CanvasLayer

signal scene_changed

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var animation_player
var black_curtain


# Called when the node enters the scene tree for the first time.
func _ready():

	animation_player = $AnimationPlayer
	black_curtain = $Control/Black
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func change_scene_to(scene, delay=0.5):
	yield(get_tree().create_timer(delay), "timeout")
	animation_player.play("fade")
	yield(animation_player, "animation_finished")
	assert(get_tree().change_scene_to(scene) == OK)
	animation_player.play_backwards("fade")
	yield(animation_player, "animation_finished")
	emit_signal("scene_changed")
	
	
	
	
