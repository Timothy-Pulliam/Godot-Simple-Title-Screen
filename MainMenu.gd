extends Node

var background_index = 0
var background_images = ["res://Assets/background0.jpg", "res://Assets/background1.jpg", "res://Assets/background2.jpg"]
var play_forward = true

# Called when the node enters the scene tree for the first time.
func _ready():
	position_background($AnimationPlayer/Background1)
	position_background($AnimationPlayer/Background2)

func position_background(background):
	# set background image
	var viewport_width = get_viewport().size.x
	var viewport_height = get_viewport().size.y
	var sprite_width = background.get_rect().size.x
	var sprite_height = background.get_rect().size.y
	var x_scale = viewport_width / sprite_width
	var y_scale = viewport_height / sprite_height
	background.set_scale(Vector2(x_scale, y_scale))
	background.set_position(Vector2(viewport_width/2, viewport_height/2))
	

func _input(event):
	# Quit game if Escape key is pressed. You may not want this.
	if event is InputEventKey:
		if event.pressed and event.scancode == KEY_ESCAPE:
			get_tree().quit()


func _on_TransitionBackground_timeout():
	background_index = (background_index + 1) % 3
	if play_forward:
		$AnimationPlayer.play("background_transition")
		$AnimationPlayer/Background2.set_texture(load(background_images[background_index]))
		position_background($AnimationPlayer/Background2)
	else:
		$AnimationPlayer.play_backwards("background_transition")
		$AnimationPlayer/Background1.set_texture(load(background_images[background_index]))
		position_background($AnimationPlayer/Background1)
	play_forward = not play_forward
	

	


