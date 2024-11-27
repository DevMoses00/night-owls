extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	# change time amount for however long the opening is
	SoundManager.fade_in_bgs("horrorLoop",2.0)
	await get_tree().create_timer(4).timeout
	fade_tween($vineMoss)
	await get_tree().create_timer(10).timeout
	fade_tween($quoteBox)
	await get_tree().create_timer(11).timeout
	SoundManager.play_sfx("chime")
	$title.show()
	await get_tree().create_timer(4).timeout
	$play.show()
	# display the play and static mode check


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func fade_tween(image) -> void:
	var fadeTween = get_tree().create_tween()
	fadeTween.tween_property(image,"modulate",Color(1.0, 1.0, 1.0, 1.0), 2)
	fadeTween.tween_interval(5)
	fadeTween.tween_property(image,"modulate",Color(1.0, 1.0, 1.0, 0.0), 2)


func _on_play_pressed() -> void:
	$play.hide()
	SoundManager.fade_in_bgs("room",1.0, 0.0, -81, -1)
	$title.hide()
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file("res://scenes/main.tscn")


func _on_check_button_toggled(toggled_on: bool) -> void:
	if toggled_on == true:
		$background.hide()
	else:
		$background.show()
