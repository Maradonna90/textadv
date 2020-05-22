#TODO: make interface class of it?
extends Node
# Command name, ex: "GO", "GIVE", "SEE"
var identifier = "GO"

# ex: [IDENTIFIER] [DIRECTION]
# ex2: [IDENTIFIER] [CHARACTER] [ITEM], "GIVE INNKEEPER GOLD"
var syntax = [global.ARG_TYPE.IDENTIFER, global.ARG_TYPE.DIRECTION]

func execute(para):
	""" execute the command with the given parameters """
	pass
