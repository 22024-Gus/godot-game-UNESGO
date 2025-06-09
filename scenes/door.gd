extends Area2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@export var target_level: PackedScene


func _on_body_entered(body: Node2D) -> void:
	if (body.name == "CharacterBody2D"):
		animated_sprite_2d.play("opening")
		if Input.is_action_just_pressed("ui_accept"):
			get_tree().change_scene_to_packed(target_level)


func _on_body_exited(body: Node2D) -> void:
		if (body.name == "CharacterBody2D"):
			animated_sprite_2d.play("closing")
