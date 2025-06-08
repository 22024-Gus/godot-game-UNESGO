extends TextureProgressBar
@export var player: CharacterBody2D

const BARSPEED = 2
var current_bar_value = 100

func _process(delta):
		current_bar_value -= BARSPEED * delta
	
		# Don't go below zero
		current_bar_value = max(current_bar_value, 0)
	
		get_node("/root/Node/CharacterBody2D/Camera2D/Health-bar-Physical").value = current_bar_value

func add_phys_health():
	value += 25
	
	value_changed.emit()
	current_bar_value = value
