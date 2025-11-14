extends Button

func _on_Button_pressed():
    # STEP 1: Check if the function is even being called.
    print("--- Button Pressed! Attempting Scene Change ---") 
    
    # STEP 2: Execute scene change.
    var error = get_tree().change_scene_to_file("res://world.tscn")
    
    # STEP 3: Check for an error code (0 is success).
    if error != 0:
        print("!!! SCENE CHANGE FAILED with error code: ", error)
        # Error 2 is typically "File not found"
    else:
        print("Scene Change Request Successful.")
