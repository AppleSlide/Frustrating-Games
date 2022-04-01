extends KinematicBody2D

const SPEED = 3
const player_speed = 50
const MAX_SPEED = 200
const ACCELERATION = 300
const jump = -300

signal dead
#signal respawn


var animPlayer
onready var animTree = $AnimationTree
onready var animState = animTree.get('parameters/playback')
var velocity = Vector2.ZERO

func _ready():
	animPlayer = $AnimationPlayer
	animTree.active = true

func _process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength('ui_right') - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION + delta)
	if input_vector != Vector2.ZERO:
		animTree.set('parameters/Move/blend_position', input_vector)
		animState.travel('Move')
	else:
		animState.travel('Idle')
	
	if Input.is_action_just_pressed("jump") and $GhostCooldown.is_stopped():
		ghost()
		$GhostCooldown.start()
	
	#if Input.is_key_pressed(KEY_R):
		#emit_signal('respawn')

func _physics_process(delta):
	velocity = move_and_slide(velocity)

func ghost():
	$GhostTimer.start()
	set_collision_mask_bit(1, false)


func _on_GhostTimer_timeout():
	set_collision_mask_bit(1, true)



func _on_DeathArea1_body_entered(body):
	body.hide()
	emit_signal('dead')
	#$CollisionShape2D.set_deferred("disabled", true)

func spawn(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
