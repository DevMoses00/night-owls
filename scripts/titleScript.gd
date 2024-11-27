extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	# change time amount for however long the opening is
	SoundManager.fade_in_bgs("horrorLoop",2.0)
	await get_tree().create_timer(4).timeout
	fade_tween($vineMoss)
	await get_tree().create_timer(10).timeout
	fade_tween($quoteBox)
	await get_tree().create_timer(9).timeout
	$background.hide()
	SoundManager.play_sfx("chime")
	await get_tree().create_timer(7).timeout
	SoundManager.fade_in_bgs("room",1.0, 0.0, -81, -1)
	$title.hide()
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file("res://scenes/main.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func fade_tween(image) -> void:
	var fadeTween = get_tree().create_tween()
	fadeTween.tween_property(image,"modulate",Color(1.0, 1.0, 1.0, 1.0), 2)
	fadeTween.tween_interval(3)
	fadeTween.tween_property(image,"modulate",Color(1.0, 1.0, 1.0, 0.0), 2)
