extends RigidBody2D

export var speed = 400 
const MAX_TORQUE = 100000
var screen_size

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move_player(delta)
#	pass


func move_player(delta):
	var velocity = Vector2()  # The player's movement vector.
	if Input.is_action_pressed("ui_right"):
		applied_torque = MAX_TORQUE
	if Input.is_action_pressed("ui_left"):
		applied_torque = - MAX_TORQUE
	applied_torque= lerp (applied_torque, 0, 0.1)
	
