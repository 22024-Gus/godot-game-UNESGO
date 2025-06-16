extends CharacterBody2D

const SPEED = 200.0 # player speed constant
const JUMP_VELOCITY = -450.0 # player jump constant. negative due to godot being backwards with x-y values
# other variables for parts in code
@onready var sprite_2d: AnimatedSprite2D = $Sprite2D
@onready var health_bar_physical: TextureProgressBar = %"Health-bar-Physical"
@onready var health_bar_social: TextureProgressBar = %"Health-bar-Social"
@export var gameover: PackedScene

func _physics_process(delta: float) -> void:
	#animations.
	if not is_on_floor():
		sprite_2d.animation = "hopping" # will swap to jumping animation when off ground. wasn't working when named "jumping".
	elif (velocity.x > 1 || velocity.x < -1):
		sprite_2d.animation = "running" # will swap to running animatoion when any sort of velocity is given.
	else: 
		sprite_2d.animation = "default" # otherwise, will resort to idle animation.
		
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor(): # ensure player is on floor before jumping again
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("left", "right") #checks user direction
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	var isLeft = velocity.x < 0 # checks direction for animation
	
	sprite_2d.flip_h = isLeft #flips user animation to which way the playre is facing
	
	if health_bar_physical.value == 0: # checks if user has 0 value in healthbar
		get_tree().change_scene_to_packed(gameover) # swaps to gameover screen
	elif health_bar_social.value == 0: # checks if user has 0 value in healthbar
		get_tree().change_scene_to_packed(gameover) # swaps to gameover screen
