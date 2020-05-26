class Take extends "res://commands/command.gd":
	""" take an item laying in a location """
	var identifier
	var syntax
	func _init():
		identifier = "take"
		syntax = [[global.ARG_TYPE.ITEM]]
	
	func _execute(parameters):
		""" execute the command with the given parameters """
		if parameters[0] in global.current_location._get_items():
			global.transfer_item(global.current_location, global.player, parameters[0])
		else:
			emit_signal("error", "You can't.")
