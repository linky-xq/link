extends CharacterBody2D

var speed = 2.5
var held_object: RigidBody2D = null      # currently held object
var hold_offset: Vector2 = Vector2(0, 0)  # directly at player's center
var pin_joint: PinJoint2D = null
var object_to_pickup = null
func _ready():
	pass
func _physics_process(delta):
	var direction = Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1
	velocity = direction.normalized() * speed
	move_and_collide(velocity)
	if held_object:
		pin_joint.global_position = global_position + hold_offset

	# Handle pickup/drop
	if Input.is_action_just_pressed("interact"):  # e.g. key E
		if held_object:
			drop_object()
			pass
		else:
			try_pickup()
			pass

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is RigidBody2D:
		if body.has_meta("can_be_pickedup") && body.has_method("pick_up"):
			body.can_pick_up =true
			object_to_pickup = body
			
func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is RigidBody2D:
		if body.has_meta("can_be_pickedup") && body.has_method("pick_up"):
			body.can_pick_up =false
			object_to_pickup = null
func try_pickup():
	if object_to_pickup !=null:
		attach_object(object_to_pickup)

func attach_object(body: RigidBody2D):
	held_object = body
	# Configure PinJoint2D
	pin_joint = PinJoint2D.new()
	pin_joint.node_a = get_path()  # player
	pin_joint.node_b = body.get_path()  # object
	pin_joint.global_position = body.global_position  # where to attach
	pin_joint.disable_collision = true
	add_child(pin_joint)
func drop_object():
	if not held_object:
		return
	pin_joint.disable_collision = false
	if pin_joint:
		pin_joint.queue_free()
		pin_joint = null
	held_object.linear_velocity=Vector2.ZERO
	held_object = null
