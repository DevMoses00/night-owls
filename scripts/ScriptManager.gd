extends Node2D

# EXPORT VARIABLES 

# PUBLIC VARIABLES
var time : float = 1

signal panel_pull_signaled(panelnm,framenm)
signal panel_push_signaled(panelnm)
signal panel_text_signaled(charnm, text)
signal internal_text_signaled(string)
signal panel_frenzy_signaled(panelnm,framenm)
signal endgame_signaled()
signal titlecard_signaled()

# SOUND MANAGER SIGNALS
#signal 
# Called when the node enters the scene tree for the first time.
func _ready():
#	pull_panel()
	pass
#func pull_panel():
#	var panelTween = get_tree().create_tween()
#	panelTween.tween_property(panelMain, "position", Vector2(0,0), time)
