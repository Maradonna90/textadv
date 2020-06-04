class Look extends "res://commands/command.gd":
	""" investigates an item or a location """
	var identifier
	var syntax
	func _init():
		identifier = "look"
		syntax = [[global.ARG_TYPE.ITEM, global.ARG_TYPE.LOCATION, global.ARG_TYPE.CHARACTER]]
	
	func _execute(parameters):
		# TODO: implement execution
		""" execute the command with the given parameters """
		# check if its an item or location
		#if utils.get_string_arg_type(parameters[0]) == self.syntax[0][0]:
		#	emit_signal("send_description", utils.get_item_by_name(parameters[0])._get_description())
		if utils.insens_match(global.current_location._name, parameters[0]):
			print("send: ", global.current_location._detailed_desc)
			global.output.append_text(global.current_location._detailed_desc)
		
