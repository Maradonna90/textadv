class Give extends "res://commands/command.gd":
	""" give a character a specific item """
	var identifier
	var syntax
	func _init():
		identifier = "give"
		syntax = [[global.ARG_TYPE.ITEM], [global.ARG_TYPE.CHARACTER]]
	
	func _execute(parameters):
		""" execute the command with the given parameters """
		print("GIVE: ", parameters)
		if (global.player._has_item(parameters[0])) and (global.current_location._char_in_location(parameters[1])):
			global.transfer_item(global.player, global.current_location._get_char_in_location(parameters[1]), parameters[0])
		else:
			emit_signal("error", "You can't.")
