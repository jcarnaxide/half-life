extends CollisionObject3D
class_name Interactable

signal interacted(body)

@export var prompt_message := "Interact"
@export var prompt_input := "interact"


func get_prompt() -> String:
	var key_name := ""
	for action in InputMap.action_get_events(prompt_input):
		if action is InputEventKey:
			key_name = action.as_text_physical_keycode()
			break
		if action is InputEventJoypadButton:
			## TODO - This doesn't seem to work with my 8-Bit Do Controller
			key_name = "A"
	return "%s \n[%s]" % [prompt_message, key_name]


func interact(body):
	interacted.emit(body)
