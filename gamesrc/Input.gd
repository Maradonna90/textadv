extends LineEdit


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var autocomplete_hk = KEY_TAB
signal text_autocomplete(input_string)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	if Input.is_action_just_released("ui_focus_next"):
			emit_signal("text_autocomplete", self.text)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
