extends Node2D

@export var correct_password: String = "1234"
@export var next_scene_path: String = "res://world.tscn"

@onready var ui_layer = $CanvasLayer
@onready var input_field = $CanvasLayer/Control/LineEdit
@onready var feedback_label = $CanvasLayer/Control/Label
@onready var password_pad = $PasswordPad


var player_in_range = false

func _ready():
    ui_layer.visible = false
    feedback_label.text = "Enter Password:"

# Detect when player is near
func _on_Area2D_body_entered(body):
    if body.name == "Player":
        player_in_range = true

func _on_Area2D_body_exited(body):
    if body.name == "Player":
        player_in_range = false
        ui_layer.visible = false

func _process(delta):
    # Open pad if player presses E nearby
    if player_in_range and Input.is_action_just_pressed("interact"):
        ui_layer.visible = true
        input_field.grab_focus()

# When Enter button pressed
func _on_Enter_pressed():
    var entered = input_field.text.strip_edges()
    if entered == correct_password:
        feedback_label.text = "✅ Access Granted!"
        await get_tree().create_timer(1.0).timeout
        get_tree().change_scene_to_file(next_scene_path)
    else:
        feedback_label.text = "❌ Incorrect Password!"
        input_field.clear()

# When Cancel button pressed
func _on_Cancel_pressed():
    ui_layer.visible = false


func _on_area_2d_body_entered(body: Node2D) -> void:
    pass # Replace with function body.


func _on_area_2d_body_exited(body: Node2D) -> void:
    pass # Replace with function body.


func _on_button_pressed() -> void:
    pass # Replace with function body.


func _on_button_2_pressed() -> void:
    pass # Replace with function body.
func _input(event):if event.is_action_pressed("interact") :
          # absolute path
    password_pad.show()
    $PasswordPad.show() 
