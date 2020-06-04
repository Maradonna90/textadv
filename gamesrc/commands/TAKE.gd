class Take extends "res://commands/command.gd":
	""" take an item laying in a location """
	var identifier
	var syntax
	func _init():
		identifier = "take"
		syntax = [[global.ARG_TYPE.ITEM]]
	
	func _execute(parameters):
		""" execute the command with the given parameters """
		if !global.transfer_item(global.current_location, global.player, parameters[0]):
			print("error: You can't.")
