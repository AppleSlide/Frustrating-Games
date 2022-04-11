extends Node2D

var deaths = 0
var cooldown = 5

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _ready():
	$HUD/WinLabel.hide()

func _on_DeathArea1_body_entered(_body):
	$KinematicBody2D.position = $SpawnPoint.position
	deaths += 1
	$HUD.update_deathCount(deaths)

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


func _on_DeathBlock_entered():
	$KinematicBody2D.position = $SpawnPoint.position
	deaths += 1
	$HUD.update_deathCount(deaths)


func _on_WinArea_body_entered(_body):
	$HUD/WinLabel.show()
	$LobbyTimer.start()


func _on_LobbyTimer_timeout():
	Global.goto_scene("res://Lobby.tscn")
