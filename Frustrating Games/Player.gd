extends KinematicBody2D

const SPEED = 3
const player_speed = 50
const MAX_SPEED = 200
const ACCELERATION = 300
const startx = 500
const starty = 0

const jump = -300



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
		
	

func _physics_process(_delta):
	velocity = move_and_slide(velocity)

	


func ghost():
	$GhostTimer.start()
	set_collision_mask_bit(2, false)
	modulate.a = 0.5
	$GhostSound.play()


func _on_GhostTimer_timeout():
	set_collision_mask_bit(2, true)
	modulate.a = 1
	$GhostSound.play()



