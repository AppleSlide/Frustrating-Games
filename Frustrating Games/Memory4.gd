extends Node2D


var score = 0

# Declare member variables here. Examples:
# var a = 2
# var b = "text"



# Called when the node enters the scene tree for the first time.
func _ready():
	$MemoryMap4/TileMap3.hide()
	$HUD/DeathCount.hide()
	$HUD/StartButton.hide()
	$HUD/StartTime.hide()
	$HUD/WinLabel.hide()
	$HUD/DeathLabel.hide()
	$HUD/GhostCheck.hide()
	$HUD/GhostLabel.hide()
	$HUD/CooldownLabel.hide()
	$HUD.update_score(Global.score)
	$ScoreBlock/CollisionShape2D.disabled = true
	#yield(get_tree().create_timer(5), "timeout")
	#$Label.hide()
	#$Label2.hide()
	#showPath1()
	
	

func showPath2():
	$MemoryMap4/TileMap3.show()
	yield(get_tree().create_timer(10), "timeout")
	$MemoryMap4/TileMap3.hide()
	$StartPlane/CollisionShape2D.disabled = true
	$StartPlane/CollisionShape2D.disabled = true
	$MemoryMap4/TileMap3.set_collision_mask_bit(2, false)
	$MemoryMap4/TileMap3.set_collision_layer_bit(2, false)
	$MemoryMap4/TileMap3.set_collision_mask_bit(1, false)
	$MemoryMap4/TileMap3.set_collision_layer_bit(1, false)



func _on_KillPlane1_body_entered(_body):
	$Player.position.x = 500
	$Player.position.y = 0


func _on_WinPlane_body_entered(_body):
	print("You WON!") 
	$Label2.text = "THAT WASN'T TOO BAD. NEXT LEVEL INCOMING"
	$Label2.show()
	$SwitchTimer.start()
	score += 5000
	Global.score += score
	$HUD.update_score(Global.score)
	$ScoreBlock/CollisionShape2D.disabled = false




func _on_StartPlane_body_entered(_body):
	$Player.position.x = 500
	$Player.position.y = 0


func _on_Button_pressed():
	$Button.hide()
	$Label.hide()
	$Label2.hide()
	showPath2()


func _on_SwitchTimer_timeout():
	Global.goto_scene("res://ObstacleCourse1.tscn")
