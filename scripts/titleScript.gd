extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	# change time amount for however long the opening is
	await get_tree().create_timer(3).timeout
	fade_tween()
	await get_tree().create_timer(9).timeout
	$background.hide()
	await get_tree().create_timer(5).timeout
	get_tree().change_scene_to_file("res://scenes/main.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func fade_tween() -> void:
	var fadeTween = get_tree().create_tween()
	fadeTween.tween_property($quoteBox,"modulate",Color(1.0, 1.0, 1.0, 1.0), 2)
	fadeTween.tween_interval(3)
	fadeTween.tween_property($quoteBox,"modulate",Color(1.0, 1.0, 1.0, 0.0), 2)


