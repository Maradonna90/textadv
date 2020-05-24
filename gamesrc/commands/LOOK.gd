class Look extends "res://commands/command.gd":
	var _identifier = "look"
	var _syntax = [global.ARG_TYPE.ITEM]
	
	func _execute(parameters):
		""" execute the command with the given parameters """
		return parameters
