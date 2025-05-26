extends TextureProgressBar

const BARSPEED = 2
var current_bar_value = 100

func _process(delta):

	current_bar_value -= BARSPEED * delta

	# Don't go below zero
	current_bar_value = max(current_bar_value, 0)

	# Assuming this is a node you have set up
	get_node("/root/Node/Health-bar-Mental").value = current_bar_value
