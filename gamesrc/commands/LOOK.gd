class Look extends "res://commands/command.gd":
	""" investigates an item or a location """
	var identifier
	var syntax
	func _init():
		identifier = "look"
		syntax = [[global.ARG_TYPE.ITEM, global.ARG_TYPE.LOCATION]]
	
	func _execute(parameters):
		# TODO: implement execution
		""" execute the command with the given parameters """
		return parameters
