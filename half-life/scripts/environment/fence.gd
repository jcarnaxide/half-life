@tool
extends Node3D

enum Type { BASE, BROKEN, PILLAR, PILLAR_BROKEN, SEPERATE, SEPERATE_BROKEN }
@export var fence_type: Type = Type.BASE:
	set(new_type):
		fence_type = new_type
		_update_visibilty_from_fence_type()


func _update_visibilty_from_fence_type():
	for child in get_children():
		var child_enabled = child.get_index() == fence_type
		child.visible = child_enabled
		child.find_child("CollisionShape3D").disabled = !child_enabled


func _ready():
	_update_visibilty_from_fence_type()
