extends RigidBody2D

const max_speed=100
var can_pick_up = false
func _ready() -> void:
    lock_rotation=true
func _process(delta: float) -> void:
    pass
func pick_up() ->void:
    pass
    #print(test.name)
func _physics_process(delta):
    var current_velocity = linear_velocity
    if current_velocity.length() > max_speed:
        linear_velocity = current_velocity.normalized() * max_speed
    var colliders = get_colliding_bodies()
