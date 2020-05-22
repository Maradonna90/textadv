extends LineEdit
signal text_autocomplete(input_string)
signal suggest_completion(suggestions)

# Called when the node enters the scene tree for the first time.
func _ready():
	global.input = self

func _process(delta):
	if self.has_focus():
		if Input.is_action_just_pressed("in_autocomplete"):
				emit_signal("text_autocomplete", self.text)
		if Input.is_action_just_pressed("in_confirm"):
			self.text = ""


func fill_autocompletion(matched_strings, sub_strings):
	if len(matched_strings) == 1:
		sub_strings[-1] = matched_strings[0]
		self.text = utils.array_join(sub_strings, " ")+" "
		self.caret_position = len(self.text)
	if len(matched_strings) > 1:
		emit_signal("suggest_completion", matched_strings, sub_strings)
