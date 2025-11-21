@tool
extends Node3D

enum Size { SMALL, MEDIUM, LARGE }
@export var tree_size := Size.SMALL:
	set(val):
		tree_size = val
		_update_tree_size_and_style()

enum Style { ORANGE, YELLOW, DEAD }
@export var tree_style := Style.ORANGE:
	set(val):
		tree_style = val
		_update_tree_size_and_style()

const axe_sounds = [
	preload("res://assets/sfx/axe-chop/axe-chop-1.ogg"),
	preload("res://assets/sfx/axe-chop/axe-chop-2.ogg"),
	preload("res://assets/sfx/axe-chop/axe-chop-3.ogg"),
	preload("res://assets/sfx/axe-chop/axe-chop-4.ogg"),
	preload("res://assets/sfx/axe-chop/axe-chop-5.ogg"),
]

@onready var audio: AudioStreamPlayer3D = $AudioStreamPlayer3D
@onready var model: Node3D = $Model
@onready var collision: Node3D = $Collision


func _update_tree_size_and_style():
	if not model or not collision:
		return
	var size_key: String = Size.keys()[tree_size]
	size_key = size_key.capitalize()
	var style_key: String = Style.keys()[tree_style]
	style_key = style_key.capitalize()

	for size_child in model.get_children():
		for style_child in size_child.get_children():
			var enabled := size_child.name == size_key and style_child.name == style_key
			style_child.visible = enabled

	for size_child in collision.get_children():
		for style_child in size_child.get_children():
			var collision_shape: CollisionShape3D = style_child.find_child("CollisionShape3D")
			var enabled := size_child.name == size_key and style_child.name == style_key
			collision_shape.visible = enabled
			collision_shape.disabled = not enabled


func _ready() -> void:
	_update_tree_size_and_style()


func _on_interacted(_body: Variant) -> void:
	audio.stream = axe_sounds[randi()%len(axe_sounds)]
	audio.play()
