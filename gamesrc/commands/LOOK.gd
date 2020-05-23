#TODO: make interface class of it?
extends Node
# Command name, ex: "GO", "GIVE", "SEE"
var identifier = "look"

# ex: [IDENTIFIER] [DIRECTION]
# ex2: [IDENTIFIER] [CHARACTER] [ITEM], "GIVE INNKEEPER GOLD"
var syntax = [global.ARG_TYPE.ITEM]

func execute(parameters):
	""" execute the command with the given parameters """
	return parameters

