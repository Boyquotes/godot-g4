extends RigidBody2D

signal ready_for_pong(ball_position, stick_position)

const MAX_TORQUE = 10000
const MAX_ANGULAR_VELOCITY=12

const MOVEMENT_TYPES = {"none":"none","torque":"torque", "pong":"pong"}

var movement_type
var view_port

# Called when the node enters the scene tree for the first time.
func _ready():
	view_port = get_viewport_rect()
	movement_type = MOVEMENT_TYPES["torque"]
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	
	
	
	if movement_type == MOVEMENT_TYPES["torque"]:
		torque_move(delta)
	elif movement_type == MOVEMENT_TYPES["pong"]:
		pong_move(delta)
		
#	pass

func pong_move(delta):
	
	var velocity = Vector2()  # The player's movement vector.
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	
	position += velocity * delta *1.5
	position.y = clamp(position.y, 530, view_port.size.y-20)
	
	
	
	if Input.is_action_pressed("ui_up"):
		position.y-=100*delta
	if Input.is_action_pressed("ui_down"):
		position.y+=100*delta
	

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
		




func _on_PongBall_glow_started(ball_position):
	movement_type = MOVEMENT_TYPES["pong"]
	emit_signal("ready_for_pong",ball_position, position ) 
	
	pass # Replace with function body.
