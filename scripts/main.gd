extends Node2D

# EXPORT VARIABLES 
@export var resource : DialogueResource
@export var title : String
# PUBLIC VARIABLES
var time : float = 1

# ONREADY VARIABLES
@onready var character_nm = $panelTexts/MarginContainer/characterNM
@onready var text_message = $panelTexts/MarginContainer/textMessage

@onready var internal = $panelInternal/internal/textMessage

# Called when the node enters the scene tree for the first time.
func _ready():
	DialogueManager.show_dialogue_balloon(resource, title)
	ScriptManager.panel_pull_signaled.connect(pull_panel)
	ScriptManager.panel_push_signaled.connect(push_panel)
	ScriptManager.panel_text_signaled.connect(panel_text)
	ScriptManager.internal_text_signaled.connect(internal_text)
	if title == "~ s000":
		pull_dialogue()

func pull_panel(panelnm, framenm):
	panelnm = get_node(panelnm)
	framenm = panelnm.get_node(framenm)
	#framenm.show()
	# need to select the right frame according to framenm, and have that be visible and play.
	var panelTween = get_tree().create_tween()
	panelTween.tween_property(panelnm, "position", Vector2(0,0), time).set_ease(Tween.EASE_IN_OUT)
	
func push_panel(panelnm):
	panelnm = get_node(panelnm)
	var panelTween = get_tree().create_tween()
	panelTween.tween_property(panelnm, "position", panelnm.off_camera_pos, time).set_ease(Tween.EASE_IN_OUT)
	# stop playing the framenm animation and make it hidden

func panel_text(charnm,textstring):
	character_nm.text = charnm
	text_message.text = textstring


func internal_text(string):
	internal.text = string

func pull_dialogue():
	var panelTween = get_tree().create_tween()
	panelTween.tween_property($panelStranger, "position", Vector2(0,0), time).set_ease(Tween.EASE_IN_OUT)
