extends Control

const PASSWORD = "14111613"
@onready var label = $VBoxContainer/MarginContainer/Label

# This MUST be the path to your main game scene to return to.
const WORLD_SCENE_PATH = "res://Scenes/Maps/chess.tscn" 

func key_press(digit):
    # Assuming a 4-digit password, limit the input length
    if label.text.length() < 10: 
        label.text += str(digit)

# --- DIGIT BUTTONS 1-10 ---

func _on_button_pressed() -> void: 	 # Button 1
    key_press(1)

func _on_button_3_pressed() -> void: # Button 2
    key_press(2)

func _on_button_2_pressed() -> void: # Button 3
    key_press(3)

func _on_button_4_pressed() -> void: # Button 4
    key_press(4)

func _on_button_5_pressed() -> void: # Button 5
    key_press(5)

func _on_button_6_pressed() -> void: # Button 6
    key_press(6)

func _on_button_7_pressed() -> void: # Button 7
    key_press(7)

func _on_button_8_pressed() -> void: # Button 8
    key_press(8)

func _on_button_9_pressed() -> void: # Button 9
    key_press(9)

func _on_button_10_pressed() -> void: # Button 10 (Assuming '0' key)
    key_press(0)

# --- CANCEL/EXIT BUTTON (Button 11) ---
# This button now exits the keypad scene.

func _on_button_11_pressed() -> void: # Button 11 (NOW CANCEL/EXIT)
    print("Canceling password entry and returning to world scene.")
    
    # Load the world scene, overwriting the current keypad scene.
    var error = get_tree().change_scene_to_file(WORLD_SCENE_PATH)
    
    if error != 0:
        print("!!! FAILED to load world scene! Check the path: ", WORLD_SCENE_PATH)

# --- ENTER/OK BUTTON (Win Condition) ---

func _on_button_12_pressed() -> void: # Button 12 (ENTER/OK button)
    if label.text == PASSWORD:
        print("Password Correct! Changing scene...")
        
        # --- SCENE CHANGE CODE ---
        var error = get_tree().change_scene_to_file(WORLD_SCENE_PATH)
        
        if error != 0:
            print("!!! SCENE CHANGE FAILED with error code: ", error)
        # -------------------------
            
    else:
        print("wrong password entered")
        label.text = "" 	# clear input
