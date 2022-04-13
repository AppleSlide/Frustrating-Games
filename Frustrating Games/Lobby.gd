extends Node2D

var cooldown = 5
# Called when the node enters the scene tree for the first time.
func _ready():
	$HUD/WinLabel.hide()
	$HUD/StartButton.hide()
	$HUD/StartTime.hide()

func _process(delta):
	if $KinematicBody2D/GhostTimer.time_left > 0:
		$CooldownTimer.start()
		$HUD.update_ghostCheck()

func _on_CooldownTimer_timeout():
	cooldown -= 1
	$HUD.update_cooldown(cooldown)
	if cooldown == 0:
		$CooldownTimer.stop()
		cooldown = 5
		$HUD.update_cooldown(cooldown)
		$HUD/GhostCheck.text = str("Ready")


func _on_TutorialTeleport1_body_entered(body):
	$KinematicBody2D.position = $TutorialTeleport1/TeleportPoint.position


func _on_TutorialTeleport2_body_entered(body):
	$KinematicBody2D.position = $TutorialTeleport2/TeleportPoint.position


func _on_TutorialExit_body_entered(body):
	$KinematicBody2D.position = $TutorialExit/TeleportPoint.position
