extends Node

var background_index = 0
var background_images = ["res://Assets/background0.jpg", "res://Assets/background1.jpg", "res://Assets/background2.jpg"]

# Called when the node enters the scene tree for the first time.
func _ready():
	position_background()



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func position_background():
	# Scale and center background image
	var viewport_width = get_viewport().size.x
	var viewport_height = get_viewport().size.y
	var sprite_width = $Background.get_rect().size.x
	var sprite_height = $Background.get_rect().size.y
	var x_scale = viewport_width / sprite_width
	var y_scale = viewport_height / sprite_height
	$Background.set_scale(Vector2(x_scale, y_scale))
	$Background.set_position(Vector2(viewport_width/2, viewport_height/2))

func transition_background():
	$Background.set_texture(load(background_images[background_index])) 
	background_index = (background_index + 1) % 3

func _input(event):
	# Quit game if Escape key is pressed. You may not want this.
	if event is InputEventKey:
		if event.pressed and event.scancode == KEY_ESCAPE:
			get_tree().quit()


func _on_TransitionBackground_timeout():
	transition_background()
	position_background()
