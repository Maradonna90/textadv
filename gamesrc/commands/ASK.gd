#TODO: make interface class of it?
extends Node
# Command name, ex: "GO", "GIVE", "SEE"
var identifier = "ask"

# ex: [IDENTIFIER] [DIRECTION]
# ex2: [IDENTIFIER] [CHARACTER] [ITEM], "GIVE INNKEEPER GOLD"
var syntax = [global.ARG_TYPE.CHARACTER, global.ARG_TYPE.CHARACTER]

func execute(parameters):
	""" execute the command with the given parameters """
	return parameters
