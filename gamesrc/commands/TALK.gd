class Talk extends "res://commands/command.gd":
	""" ask a character about another character/location """
	var identifier
	var syntax
	func _init():
		identifier = "talk"
		syntax = [[global.ARG_TYPE.CHARACTER]]
	
	func _execute(parameters):
		""" talk initiates a dialog
			the character gives information based on his knowledge
			and willingness """
		return parameters
