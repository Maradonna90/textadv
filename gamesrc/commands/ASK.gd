class Ask extends "res://commands/command.gd":
	var _identifier = "ask"
	var _syntax = [global.ARG_TYPE.CHARACTER, global.ARG_TYPE.CHARACTER]
	
	func _execute(parameters):
		""" execute the command with the given parameters """
		return parameters
