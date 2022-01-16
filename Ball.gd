extends KinematicBody2D

signal player_has_scored
signal enemy_has_scored
signal can_go_again

var speed = 100
var velocity = Vector2.ZERO

var player
var enemy

var copy


func _physics_process(delta):
	if visible:
		var collision_obj = move_and_collide((velocity * speed * delta))
		if collision_obj:
			velocity = velocity.bounce(collision_obj.normal)
			if is_collision_with_player(collision_obj):
				velocity*=1.1
	
	# TODO 
	if has_player_scored():
		emit_signal("player_has_scored")
		disconnect("player_has_scored", get_parent(), "_on_Ball_player")
		connect("player_has_scored", get_parent(), "_on_Ball_player")
		
	if has_enemy_scored():
		emit_signal("enemy_has_scored")
	
# Called when the node enters the scene tree for the first time.
func _ready():
	copy = duplicate(true)
	hide()
	player = get_parent().find_node("PongStick")
	enemy = get_parent().find_node("EnemyStick")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass




func _on_PongBall_can_replace_ball(ball_position):
	show()
	make_it_go()
	
	pass # Replace with function body.

func is_collision_with_player(collision_object):
	return collision_object.get_collider() == player
	
func has_player_scored():
	return position.x > enemy.position.x + 2
	
	
func has_enemy_scored():
	return position.x < player.position.x - 2


func _on_Level2_score_updated():
	reset_ball()


func reset_ball():
	position = copy.position
	velocity = Vector2.ZERO
	shine_ball_and_grow_enemy(5)
	
	

func shine_ball_and_grow_enemy(times=4):
	while times>0:
		for i in range(100):
			$Sprite/BallShine.modulate.a=i/100.0
			yield(get_tree().create_timer(0.005), "timeout")
			
		times-=1
		yield(get_tree().create_timer(0.005), "timeout")
		enemy.scale*=1.1
	emit_signal("can_go_again")
func make_it_go():
	velocity.x= -1
	velocity.y= 0.8


func _on_Ball_can_go_again():
	
	make_it_go()
