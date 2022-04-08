extends KinematicBody2D

export var vertical = true
export var direction = 1
export var speed = 50
var velocity = Vector2()
signal entered


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	velocity = move_and_slide(velocity, Vector2.ZERO)
	if vertical:
		$WallDetectorH.enabled = false
		velocity.y = speed * direction
		if $WallDetector.is_colliding():
			direction *= -1
			$WallDetector.cast_to.y *= -1
	
	elif not vertical:
		velocity.x = speed * direction
		$WallDetector.enabled = false
		if $WallDetectorH.is_colliding():
			direction*= -1
			$WallDetectorH.cast_to.x *= -1
			

func _on_Deathbox_body_entered(_body):
	emit_signal("entered")
