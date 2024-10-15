class_name Panels
extends AnimatedSprite2D


# EXPORT VARIABLES 
@export var off_camera_pos : Vector2
# ONREADY VARIABLES
#@onready var panelTween: Tween = get_tree().create_tween()

# PUBLIC VARIABLES
var time : float = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	position = off_camera_pos

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
