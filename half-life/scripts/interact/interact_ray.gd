extends RayCast3D

@onready var prompt: Label = $Prompt


func _physics_process(_delta: float) -> void:
	if is_colliding():
		var collider = get_collider()
		if collider is Interactable:
			prompt.text = collider.get_prompt()
			prompt.show()
			if Input.is_action_just_pressed(collider.prompt_input):
				collider.interact(owner)
	else:
		prompt.hide()
