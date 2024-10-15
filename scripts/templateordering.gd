# CLASS NAME
extends Node

 
const Balloon = preload("res://dialogue/balloon.tscn")
# EXPORT VARIABLES
	# use @export_category("Category Name") to name the category in the inspector
	# use @export_group("Group Name") to organize exported variables
	# use @export_subgroup("Group Name") to organize exported variables within a group
	# use @export_range(min, max, step_val) var something = __ to create a range
@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "start"

# PUBLIC VARIABLES

# PRIVATE VARIABLES

# ONREADY VARIABLES

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#func action() -> void:
#	var balloon: Node = Balloon.instantiate()
#	get_tree().current_scene.add_child(balloon)
#	balloon.start(dialogue_resource, dialogue_start)
