extends Control


var selected = 0
var sub_strings = null

signal change_focus()

#TODO: Check how to do this better maybe with containers?
func _ready():
	global.comba_sel = self

func _process(delta):
	if any_focus():
		if Input.is_action_just_pressed("auto_next"):
			selected = (selected+1) % self.get_child_count()
			self.get_child(selected).grab_focus()
		elif Input.is_action_just_pressed("auto_cancel"):
			destroy()
		elif Input.is_action_just_pressed("in_confirm"):
			#TODO: handle confirmed action
			#emit_signal("confirm_suggestion", [self.get_child(selected).text], sub_strings)
			destroy()
		elif Input.is_action_just_pressed("auto_prev"):
			selected = int(max(selected-1,0)) % self.get_child_count()
			self.get_child(selected).grab_focus()

func received_player(player, targets):
	#TODO: create button for every COMBAT OPTION for CHARACTER
	for key in player._combat_actions:
		print("combat_sel_key: ", key)
		#TODO iwie headings oder so
		for val in player._combat_actions[key]:
			if val == null:
				break
			var button = Button.new()
			button.text = val.identifier
			add_child(button)
	self.selected = self.get_child_count()-1
	self.get_child(self.selected).grab_focus()
	
func destroy():
	for n in self.get_children():
		self.remove_child(n)
	self.selected = 0
	emit_signal("change_focus")
	
func any_focus():
	if self.has_focus():
		return true
	for n in self.get_children():
		if n.has_focus():
			return true
	return false
