extends Area2D

@onready var health_bar_physical: TextureProgressBar = %"Health-bar-Physical"
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D



func _on_body_entered(body: Node2D) -> void:
	if (body.name == "CharacterBody2D"):
		animated_sprite_2d.animation = "collected"
		health_bar_physical.add_phys_health()
		queue_free()
