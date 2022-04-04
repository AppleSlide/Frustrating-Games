extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func update_deathCount(count):
	$DeathCount.text = str(count)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func update_cooldown(down):
	$CooldownLabel.text = str(down)
	
func update_ghostCheck():
	$GhostCheck.text = str("Wait")
