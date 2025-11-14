extends Button

# The path to your AudioStreamPlayer node relative to this Button node.
# If the VoicePlayer is a sibling of the Button, you would use 'get_parent().get_node("VoicePlayer")'
@onready var voice_player: AudioStreamPlayer = $"VoicePlayer"

# Called when the node enters the scene tree for the first time.
func _ready():
    # Check if the reference was successfully found
    if !is_instance_valid(voice_player):
        push_error("Error: AudioStreamPlayer 'VoicePlayer' not found! Check node path.")

# --- Connection Step (Connect 'pressed()' signal in the editor to this function) ---

func _on_button_pressed():
    # Check if the player is valid and the sound is not already playing
    if is_instance_valid(voice_player) and not voice_player.is_playing():
        voice_player.play()
        print("Playing voice message.")
    elif voice_player.is_playing():
        # Optional: You can stop and restart the voice, or just let it finish.
        print("Voice is already playing.")
