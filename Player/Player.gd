extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var acceleration = 5
var rotationSpeed = 5
var maxSpeed = 400

var speed = 0
var direction = 270

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if Input.is_action_pressed("forward"):
		speed += acceleration * delta
		if(speed > 400):
			speed = 400
	if Input.is_action_pressed("right"):
		direction += rotationSpeed
		rotation += rotationSpeed * PI/180
	if Input.is_action_pressed("left"):
		direction -= rotationSpeed
		rotation -= rotationSpeed * PI/180
	position += Vector2(speed * cos(direction * PI/180), speed * sin(direction * PI/180))
	
	if position.x > 1024:
		position.x -= 1024
	if position.x < 0:
		position.x += 1024
	if position.y > 600:
		position.y -= 600
	if position.y < 0:
		position.y += 600

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
