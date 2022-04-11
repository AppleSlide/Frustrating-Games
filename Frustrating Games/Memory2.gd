extends Node2D




# Declare member variables here. Examples:
# var a = 2
# var b = "text"



# Called when the node enters the scene tree for the first time.
func _ready():
	$MemoryMap2/TileMap3.hide()
	#yield(get_tree().create_timer(5), "timeout")
	#$Label.hide()
	#$Label2.hide()
	#showPath1()
	
	

func showPath1():
	$MemoryMap2/TileMap3.show()
	yield(get_tree().create_timer(10), "timeout")
	$MemoryMap2/TileMap3.hide()
	$StartPlane/CollisionShape2D.disabled = true
	$StartPlane/CollisionShape2D.disabled = true
	$MemoryMap2/TileMap3.set_collision_mask_bit(2, false)
	$MemoryMap2/TileMap3.set_collision_layer_bit(2, false)
	$MemoryMap2/TileMap3.set_collision_mask_bit(1, false)
	$MemoryMap2/TileMap3.set_collision_layer_bit(1, false)



func _on_KillPlane1_body_entered(body):
	$Player.position.x = 500
	$Player.position.y = 0


func _on_WinPlane_body_entered(body):
	print("You WON!") 
	Global.goto_scene("res://World.tscn")




func _on_StartPlane_body_entered(body):
	$Player.position.x = 500
	$Player.position.y = 0


func _on_Button_pressed():
	$Button.hide()
	$Label.hide()
	$Label2.hide()
	showPath1()
