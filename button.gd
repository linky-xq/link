extends Button

# --- CONFIGURATION ---
# Change this path to the file path of the scene you want to load!
const NEXT_SCENE_PATH = "res://Scenes/Maps/chess.tscn"

# --- SIGNAL CONNECTION ---
# Connect the built-in 'pressed()' signal from the Button node to this function.

func _on_button_pressed() -> void:
    print("Button pressed. Attempting to load scene: ", NEXT_SCENE_PATH)
    
    var error = get_tree().change_scene_to_file(NEXT_SCENE_PATH)
    
    if error != 0:
        # If error code is not 0 (OK), print the error
        print("!!! SCENE CHANGE FAILED! Godot Error Code: ", error)
    else:
        print("Scene loaded successfully.")
