class Go extends "res://commands/command.gd":
	""" move into a specific direction (or out of a room) """
	var identifier
	var syntax
	func _init():
		identifier = "go"
		syntax = [[global.ARG_TYPE.DIRECTION]]
	
	func _execute(parameters):
		""" GO into the choosen direction
			syntax: [DIRECTION] """
		if parameters[0] in global.current_location.exits:
			global.change_location(global.current_location.exits[parameters[0]])
		else:
			emit_signal("error", "You can't go there.")
