extends CharacterBody2D
signal hit

@export var speed = 200
var screen_size

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
	print(move_and_slide())


func _on_body_entered(_body: Node2D) -> void:
	hide()
	hit.emit()
	# Must be later, we can't change physics properties on physics callback WHAT IS A PHYSICS CALLBACK
	$CollisionShape2D.set_deferred("disabled", true)
	
func start(pos):
	position = pos
	show()
	$ColissionShape2d.disabled = false
