extends Node

@onready var health_bar_physical: TextureProgressBar = $"../CharacterBody2D/Camera2D/Health-bar-Physical"
@onready var health_bar_social: TextureProgressBar = $"../CharacterBody2D/Camera2D/Health-bar-Social"
@onready var health_bar_mental: TextureProgressBar = $"../CharacterBody2D/Camera2D/Health-bar-Mental"



var points = 0

func add_point():
	points += 1
	print(points)

func add_phys_health():
	health_bar_physical.set_value(health_bar_physical.value + 10)
	health_bar_physical.get_progress_texture()
	print(health_bar_physical.value)
