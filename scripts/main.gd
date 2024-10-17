extends Node2D

# EXPORT VARIABLES 
@export var resource : DialogueResource
@export var title : String
# PUBLIC VARIABLES
var time : float = 1
var randtime = randf_range(0.7,1.7)

# ONREADY VARIABLES
@onready var text_message = $panelTexts/blank/MarginContainer/textMessage
@onready var character_nm = $panelTexts/blank/MarginContainer/characterNM
@onready var internal = $panelInternal/blank/internal/textMessage

# Called when the node enters the scene tree for the first time.
func _ready():
	DialogueManager.show_dialogue_balloon(resource, title)
	ScriptManager.panel_pull_signaled.connect(pull_panel)
	ScriptManager.panel_push_signaled.connect(push_panel)
	ScriptManager.panel_text_signaled.connect(panel_text)
	ScriptManager.internal_text_signaled.connect(internal_text)
	ScriptManager.panel_frenzy_signaled.connect(panel_frenzy)
	ScriptManager.endgame_signaled.connect(endgame)
	ScriptManager.titlecard_signaled.connect(titlecardfade)
	if title == "~ s000":
		pull_dialogue()

func pull_panel(panelnm, framenm):
	#var panelgroup = get_tree().get_nodes_in_group(panelnm)
	#panelgroup.hide_all()
	panelnm = get_node(panelnm)
	for i in panelnm.get_children():
		i.hide()
	#assert(panelnm)
	#panelnm.propagate_call("set_visible", [false])
	#panelnm.visible = true
	framenm = panelnm.get_node(framenm)
	framenm.show()
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

func panel_frenzy(panelnm, framenm):
	panelnm = get_node(panelnm)
	framenm = panelnm.get_node(framenm)
	framenm.show()
	# need to select the right frame according to framenm, and have that be visible and play.
	var panelTween = get_tree().create_tween().set_loops(9)
	panelTween.tween_property(panelnm, "position", Vector2(0,0), .5).set_ease(Tween.EASE_IN_OUT)
	panelTween.tween_callback(rand)
	panelTween.tween_interval(randtime)
	panelTween.tween_property(panelnm, "position", panelnm.off_camera_pos, .5).set_ease(Tween.EASE_IN_OUT)
	panelTween.tween_callback(rand)
	panelTween.tween_interval(randtime)

func rand():
	var randtime = randf_range(0.7,1.7)
func endgame():
	print("connected")
	push_panel("panelDoor")
	await get_tree().create_timer(3.0).timeout
	var endTween = get_tree().create_tween()
	endTween.tween_property($panelMain,"scale",Vector2(1.5,1.5) ,10)
	endTween.parallel().tween_property($panelMain,"position",Vector2(52,147),10)
	endTween.tween_interval(3.0)
	endTween.tween_property($panelMain,"scale",Vector2(8.5,8.5) ,0.7)
	endTween.finished.connect(lastlines)


func lastlines():
	DialogueManager.show_dialogue_balloon(resource, "~ end")

func titlecardfade():
	var fadeTween = get_tree().create_tween()
	fadeTween.tween_property($quoteBox,"modulate",Color(1.0, 1.0, 1.0, 1.0), 4)
