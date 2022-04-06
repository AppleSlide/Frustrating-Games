extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"



# Called when the node enters the scene tree for the first time.
func _ready():
	$TileMap/TileMap3.hide()
	yield(get_tree().create_timer(3), "timeout")
	showPath()
	
	

func showPath():
	$TileMap/TileMap3.show()
	yield(get_tree().create_timer(10), "timeout")
	$TileMap/TileMap3.hide()
	$TileMap/TileMap3.set_collision_mask_bit(1, false)
	$TileMap/TileMap3.set_collision_layer_bit(1, false)



func _on_KillPlane1_body_entered(body):
	$Player.position.x = 500
	$Player.position.y = 0# Replace with function body.


func _on_WinPlane_body_entered(body):
	print("You WON!") # Replace with function body.
