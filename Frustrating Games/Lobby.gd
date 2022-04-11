extends Node2D

var cooldown = 5
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_CooldownTimer_timeout():
	cooldown -= 1
	$HUD.update_cooldown(cooldown)
	if cooldown == 0:
		$CooldownTimer.stop()
		cooldown = 5
		$HUD.update_cooldown(cooldown)
		$HUD/GhostCheck.text = str("Ready")
		
func _process(_delta):
	if $KinematicBody2D/GhostTimer.time_left > 0:
		$CooldownTimer.start()
		$HUD.update_ghostCheck()


func _on_TutorialTeleport_body_entered(_body):
	$KinematicBody2D.position = $TutorialTeleport/TeleportPoint.position


func _on_TutorialTeleport2_body_entered(_body):
	$KinematicBody2D.position = $TutorialTeleport2/TeleportPoint.position


func _on_TutorialExit_body_entered(_body):
	$KinematicBody2D.position = $TutorialExit/TeleportPoint.position
