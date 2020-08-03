extends ItemList


var next_scene


# Called when the node enters the scene tree for the first time.
func _ready():
	for index in range(get_item_count()):
		set_item_tooltip_enabled(index, false);
	select(0)
	grab_focus();
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	for index in range(get_item_count()):
#		print(is_item_selectable(index))

func _on_ItemList_item_activated(index):
	if get_item_text(index) == "Credits":
		next_scene = "res://GodotCredits.tscn"
	elif get_item_text(index) == "New Game":
		next_scene = "res://New Game/NewGame.tscn"
	elif get_item_text(index) == "Settings":
		next_scene = "res://New Game/Settings.tscn"
	elif get_item_text(index) == "Continue":
		next_scene = "res://New Game/Continue.tscn"
	elif get_item_text(index) == "Quit":
		get_tree().quit()
	get_node("/root/MainMenu/FadeIn").show()
	get_node("/root/MainMenu/FadeIn").fade_in()

func _on_FadeIn_fade_finished():
	get_tree().change_scene(next_scene)


