extends Area2D

# --- Configuration ---
# 1. Define the scene to load upon successful puzzle completion
const NEXT_SCENE_PATH = "res://world2.tscn"
# 2. Define the RigidBody group name to look for
const TARGET_OBJECT_GROUP = "puzzle" 

# --- Setup ---
# Connect the 'body_entered' signal from the Area2D node to this function
# In the Godot Editor: Select Area2D -> Node Tab -> Signals -> double-click 'body_entered' -> Connect to script
func _on_body_entered(body: Node2D):
    # Check if the colliding body is in the correct group ("puzzle")
    if body.is_in_group(TARGET_OBJECT_GROUP):
        # We've detected the correct object on the trigger tile
        print("Puzzle piece detected! Initiating scene change.")
        change_game_scene()

func change_game_scene():
    # Standard function to handle the scene change logic
    var error = get_tree().change_scene_to_file(NEXT_SCENE_PATH)
    
    if error != 0:
        print("!!! SCENE CHANGE FAILED with error code: ", error)
        print("!!! Check if the path ", NEXT_SCENE_PATH, " is correct.")
    else:
        print("Scene Change Request Successful.")
