extends RigidBody2D

signal may_construct_pong_court

const MAX_TORQUE = 10000
const MAX_ANGULAR_VELOCITY=12

const MOVEMENT_TYPES = {"none":"none","torque":"torque", "pong":"pong"}

var movement_type

# Called when the node enters the scene tree for the first time.
func _ready():
	movement_type = MOVEMENT_TYPES["torque"] 
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if movement_type == MOVEMENT_TYPES["torque"]:
		torque_move(delta)
	elif movement_type == MOVEMENT_TYPES["pong"]:
		pong_move()
#	pass

func pong_move():
	pass


func torque_move(delta):
	if Input.is_action_pressed("ui_right"):
		applied_torque = MAX_TORQUE
	if Input.is_action_pressed("ui_left"):
		applied_torque = - MAX_TORQUE
	applied_torque= lerp (applied_torque, 0, 0.1)
	if angular_velocity <0 and angular_velocity < -MAX_ANGULAR_VELOCITY:
		angular_velocity = -MAX_ANGULAR_VELOCITY
	if angular_velocity >0 and angular_velocity >MAX_ANGULAR_VELOCITY:
		angular_velocity = MAX_ANGULAR_VELOCITY
		


func _on_Level1_ball_in_hole():
	#movement_type = MOVEMENT_TYPES["none"]
	emit_signal("may_construct_pong_court")
	pass # Replace with function body.
