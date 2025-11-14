# multi_tile_puzzle_manager.gd (Attach to the MultiTilePuzzle Node)
extends Node2D # Or 'Node', if it doesn't need 2D position

const NEXT_SCENE_PATH = "res://next_level.tscn" # <--- UPDATE THIS PATH!
const TARGET_SPOTS = ["Area2D", "Area2D_2", "Area2D_3", "Area2D_4"] # <--- Ensure these names match your Area2D nodes

# Use a Dictionary to track which spots are currently filled
var spots_filled: Dictionary = {}

func _ready():
    # 1. Initialize the spots_filled dictionary
    for name in TARGET_SPOTS:
        spots_filled[name] = false
        
    # 2. Connect the custom signals from the four child spots to this manager
    for name in TARGET_SPOTS:
        var child = find_child(name)
        if child and child is Area2D:
            # NOTE: The manager CONNECTS to the signals EMITTED by the spots.
            # Ensure the signals "object_placed" and "object_removed" are defined in the spot script!
            child.connect("object_placed", Callable(self, "_on_spot_changed"))
            child.connect("object_removed", Callable(self, "_on_spot_changed"))


# --- Slot Status Update ---
# This function is called when one of the Area2D signals (placed/removed) is emitted.
func _on_spot_changed(spot_name: String, is_placed: bool): # Receive status directly from the Spot
    # Update the tracking dictionary
    spots_filled[spot_name] = is_placed
    
    print("Spot ", spot_name, " status: ", is_placed)

    # Check the win condition every time a spot changes
    _check_win_condition()


# --- Win Condition Check ---
func _check_win_condition():
    var all_filled = true
    
    # Iterate through the dictionary; if any value is False, we haven't won
    for filled in spots_filled.values():
        if !filled:
            all_filled = false
            break

    if all_filled:
        print("ALL SPOTS FILLED! PUZZLE COMPLETE.")
        change_game_scene()

func change_game_scene():
    # Stop checking once the scene change starts
    set_process(false)
    
    var error = get_tree().change_scene_to_file(NEXT_SCENE_PATH)
    # ... (Add error checking here if needed)
