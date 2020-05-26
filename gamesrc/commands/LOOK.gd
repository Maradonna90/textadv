class Look extends "res://commands/command.gd":
	""" investigates an item or a location """
	var identifier
	var syntax
	signal send_description(text)
	func _init():
		identifier = "look"
		syntax = [[global.ARG_TYPE.ITEM, global.ARG_TYPE.LOCATION]]
	
	func _execute(parameters):
		# TODO: implement execution
		""" execute the command with the given parameters """
		# check if its an item or location
		if utils.get_string_arg_type(parameters[0]) == self.syntax[0][0]:
			emit_signal("send_description", utils.get_item_by_name(parameters[0])._get_description())
		elif utils.get_string_arg_type(parameters[0]) == self.syntax[0][1]:
			emit_signal("send_description", global.current_location._get_description())
		
