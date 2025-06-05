extends Area2D

@onready var health_bar_physical: TextureProgressBar = %"Health-bar-Physical"


func _on_body_entered(body: Node2D) -> void:
	if (body.name == "CharacterBody2D"):
		queue_free()
		health_bar_physical.add_phys_health()
