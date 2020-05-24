class Take extends "res://commands/command.gd":
	""" take an item laying in a location """
	var identifier
	var syntax
	func _init():
		identifier = "take"
		syntax = [[global.ARG_TYPE.ITEM]]
	
	func _execute(parameters):
		#TODO: implement execution
		""" execute the command with the given parameters """
		return parameters
