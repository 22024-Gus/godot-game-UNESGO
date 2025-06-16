extends TextureProgressBar
@export var player: CharacterBody2D # get variable for player

const BARSPEED = 2 # sets barspeed - how fast bar will go down
var current_bar_value = 100 # sets original value to 100

func _process(delta):
	if (player.velocity.x > 1 || player.velocity.x < -1 || player.velocity.y > 1 || player.velocity.y < -1):
		current_bar_value -= BARSPEED * delta # removes value every frame depending on barspeed - so every 2 seconds to the frame
	
		# Don't go below zero
		current_bar_value = max(current_bar_value, 0) 
	
		get_node("/root/Node/CharacterBody2D/Camera2D/Health-bar-Physical").value = current_bar_value # set value to bar value

func add_phys_health():
	value += 25 # adds value to healthbar
	
	value_changed.emit() # emits change to screen
	current_bar_value = value # sets bar value to current value
