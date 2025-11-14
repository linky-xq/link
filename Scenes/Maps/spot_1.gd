extends Area2D

var box_inside := false

func _on_spot1_body_entered(body):
    if body is RigidBody2D:
        box_inside = true
        get_parent().check_puzzle()

func _on_spot1_body_exited(body):
    if body is RigidBody2D:
        box_inside = false
        get_parent().c_
