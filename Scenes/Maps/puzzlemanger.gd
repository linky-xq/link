extends Node2D

func check_puzzle():
    for spot in get_children():
        if spot is Area2D:
            if not spot.box_inside:
                $nextbutton.visible = false
                return

    $nextbutton.visible = true

func _on_nextbutton_pressed():
    get_tree().change_scene_to_file("res://NextScene.tscn")
