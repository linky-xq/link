extends Node2D

var current_level=1
# Called when the node enters the scene tree for the first time.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
    pass




func _on_spot_1_body_entered(body: Node2D) -> void:
    pass # Replace with function body.


func _on_spot_1_body_exited(body: Node2D) -> void:
    pass # Replace with function body.


func _on_nextbutton_pressed() -> void:
    pass # Replace with function body.




# ... other code or variables ...



# ... other functions ...


func _on_Button_pressed() -> void:
    get_tree().change_scene_to_file("res://keypad.tscn")




    # world.gd




func _on_do_ri_pressed() -> void:
   $"do ri/AudioStreamPlayer2D".play()



func _on_button_pressed() -> void:
    if is_inside_tree():
        get_tree().change_scene_to_file("res://pad.tscn")


func _on_botton_2_pressed() -> void:
   get_tree().change_scene_to_file("res://Scenes/Maps/keypad.tscn")
