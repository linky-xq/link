# puzzle_spot.gd (Attach to each Area2D node: Area2D, Area2D_2, etc.)
extends Area2D

# 1. Define custom signals that the Manager will connect to
signal object_placed(spot_name, is_placed) # emits: name, true
signal object_removed(spot_name, is_placed) # emits: name, false

const TARGET_OBJECT_GROUP = "puzzle" # Must match your RigidBody's group

# Connect this function to the Area2D's built-in 'body_entered' signal
func _on_body_entered(body: Node2D):
    if body.is_in_group(TARGET_OBJECT_GROUP):
        # Tell the manager this spot is now filled (True)
        emit_signal("object_placed", name, true) 

# Connect this function to the Area2D's built-in 'body_exited' signal
func _on_body_exited(body: Node2D):
    if body.is_in_group(TARGET_OBJECT_GROUP):
        # Tell the manager this spot is now empty (False)
        emit_signal("object_removed", name, false)
