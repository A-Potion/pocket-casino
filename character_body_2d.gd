extends CharacterBody2D
signal hit

@export var speed = 200
var screen_size
signal want_to_play_slot
@onready var slot_machine = get_node('res://slot_machine.tscn')

func _ready():
	screen_size = get_viewport_rect().size


func _physics_process(_delta):
	velocity = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
		
	move_and_slide()
	
func _process(_delta):
	if Input.is_action_just_pressed("interact"):
		print("Let's go gambling!")
		want_to_play_slot.emit()


func _on_body_entered(_body: Node2D) -> void:
	hide()
	hit.emit()
	# Must be later, we can't change physics properties on physics callback WHAT IS A PHYSICS CALLBACK
	$CollisionShape2D.set_deferred("disabled", true)
	
func start(pos):
	position = pos
	show()
	$ColissionShape2d.disabled = false
