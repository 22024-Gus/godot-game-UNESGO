extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -450.0
@onready var sprite_2d: AnimatedSprite2D = $Sprite2D
@onready var health_bar_physical: TextureProgressBar = %"Health-bar-Physical"
@onready var health_bar_social: TextureProgressBar = %"Health-bar-Social"
@export var gameover: PackedScene

func _physics_process(delta: float) -> void:
	#animations.
	if not is_on_floor():
		sprite_2d.animation = "hopping"
	elif (velocity.x > 1 || velocity.x < -1):
		sprite_2d.animation = "running"
	else: 
		sprite_2d.animation = "default"
		
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	var isLeft = velocity.x < 0
	
	sprite_2d.flip_h = isLeft
	
	if health_bar_physical.value == 0:
		get_tree().change_scene_to_packed(gameover)
	elif health_bar_social.value == 0:
		get_tree().change_scene_to_packed(gameover)
