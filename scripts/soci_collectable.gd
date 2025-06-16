extends Area2D

@onready var health_bar_social: TextureProgressBar = %"Health-bar-Social"
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


func _on_body_entered(body: Node2D) -> void:
	if (body.name == "CharacterBody2D"): # checks if thing touched is player
		animated_sprite_2d.animation = "collected" # changes to collect animation
		health_bar_social.add_soci_health() # adds physical health
		queue_free() # deletes object
