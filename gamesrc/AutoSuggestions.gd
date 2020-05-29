extends Control

var selected = 0
var sub_strings = null

signal confirm_suggestion(string)
signal change_focus()

#TODO: Check how to do this better maybe with containers?
func _process(delta):
	if any_focus():
		if Input.is_action_just_pressed("auto_next"):
			selected = (selected+1) % self.get_child_count()
			self.get_child(selected).grab_focus()
		elif Input.is_action_just_pressed("auto_cancel"):
			destroy()
		elif Input.is_action_just_pressed("in_confirm"):
			emit_signal("confirm_suggestion", [self.get_child(selected).text], sub_strings)
			destroy()
		elif Input.is_action_just_pressed("auto_prev"):
			selected = int(max(selected-1,0)) % self.get_child_count()
			self.get_child(selected).grab_focus()

func received_suggestions(suggestions, sub_strings):
	self.sub_strings = sub_strings
	for suggest in suggestions:
		var button = Button.new()
		button.text = suggest
		add_child(button)
	self.get_child(0).grab_focus()
	
func destroy():
	for n in self.get_children():
		self.remove_child(n)
	emit_signal("change_focus")
	
func any_focus():
	if self.has_focus():
		return true
	for n in self.get_children():
		if n.has_focus():
			return true
	return false
