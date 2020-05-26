class Give extends "res://commands/command.gd":
	""" give a character a specific item """
	var identifier
	var syntax
	func _init():
		identifier = "give"
		syntax = [[global.ARG_TYPE.ITEM], [global.ARG_TYPE.CHARACTER]]
	
	func _execute(parameters):
		""" execute the command with the given parameters """
		if (parameters[0] in global.player.get_inventory()) and (parameters[1] in global.current_location._get_characters()):
			global.transfer_item(global.player, parameters[1], parameters[0])
		else:
			emit_signal("error", "You can't.")
