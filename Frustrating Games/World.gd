extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_DeathArea1_body_entered(body):
	$KinematicBody2D.hide()
	

func respawn():
	$KinematicBody2D.spawn($SpawnPoint.position)


func _on_KinematicBody2D_dead():
	respawn()

