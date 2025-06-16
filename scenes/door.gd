extends Area2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@export var target_level: PackedScene

func _on_body_entered(body: Node2D) -> void:
	if (body.name == "CharacterBody2D"): # checks if it is character touching
		animated_sprite_2d.play("opening") # open animation
		get_tree().change_scene_to_packed(target_level) #change to 'targert level set on the door object, main or building

func _on_body_exited(body: Node2D) -> void:
		if (body.name == "CharacterBody2D"): # checks if it is character touching
			animated_sprite_2d.play("closing") # close animation
