extends Node2D

var cooldown = 5
var countdown = 5
var score = 50000
# Called when the node enters the scene tree for the first time.
func _ready():
	$HUD/WinLabel.hide()
	$HUD/StartButton.hide()
	$HUD/StartTime.hide()
	$HUD.update_score(Global.score)
	MusicController.play_music()

func _process(_delta):
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
		$ReadySound1.play()
		$ReadySound2.play()


func _on_TutorialTeleport1_body_entered(_body):
	$KinematicBody2D.position = $TutorialTeleport1/TeleportPoint.position


func _on_TutorialTeleport2_body_entered(_body):
	$KinematicBody2D.position = $TutorialTeleport2/TeleportPoint.position


func _on_TutorialExit_body_entered(_body):
	$KinematicBody2D.position = $TutorialExit/TeleportPoint.position

func _on_GamesStart_body_entered(_body):
	$HUD/StartButton.show()
	$HUD/StartTime.show()

func _on_HUD_pressed():
	$GameStartTimer.start()
	Global.score = score
	$HUD.update_score(Global.score)
	$HUD.update_startTime(countdown)
	

func _on_GameStartTimer_timeout():
	countdown -= 1
	$HUD.update_startTime(countdown)
	if countdown == 0:
		$GameStartTimer.stop()
		Global.goto_scene("res://Memory.tscn")
