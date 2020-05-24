class Give extends "res://commands/command.gd":
	var _identifier = "give"
	var _syntax = [global.ARG_TYPE.ITEM, global.ARG_TYPE.CHARACTER]
	
	func _execute(parameters):
		""" execute the command with the given parameters """
		return parameters
