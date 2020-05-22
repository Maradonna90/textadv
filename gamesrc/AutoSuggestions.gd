extends Control

var selected = 0

signal confirm_suggestion(string)

#TODO: Check how to do this better maybe with containers?
func _process(delta):

	if Input.is_action_just_released("auto_next"):
		print("auto_next")
		selected = (selected+1) % self.get_child_count()
		self.get_child(selected).grab_focus()
	if Input.is_action_just_released("auto_cancel"):
		for n in self.get_children():
			self.remove_child(n)
		global.input.grab_focus()
	if Input.is_action_just_released("in_confirm"):
		emit_signal("confirm_suggestion", self.get_child(selected).text)
	if Input.is_action_just_released("auto_prev"):
		selected = int(max(selected-1,0)) % self.get_child_count()
		self.get_child(selected).grab_focus()

func received_suggestions(suggestions):
	print(len(suggestions))
	var i = 0
	for suggest in suggestions:
		var button = Button.new()
		var curr_pos = button.rect_position
		curr_pos[0] += i*50
		button.set_position(curr_pos)
		button.text = suggest
		#button.flat = true
		add_child(button)
		i += 1
	#TODO first suggestion auto_selected
	self.get_child(0).grab_focus()
