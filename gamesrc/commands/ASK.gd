class Ask extends "res://commands/command.gd":
	""" ask a character about another character/location """
	var identifier
	var syntax
	func _init():
		identifier = "ask"
		syntax = [[global.ARG_TYPE.CHARACTER], [global.ARG_TYPE.CHARACTER, global.ARG_TYPE.LOCATION]]
	
	func _execute(parameters):
		""" ask initiates a dialog about a specific topic
			the character gives information based on his knowledge
			and willingness """
		return parameters
