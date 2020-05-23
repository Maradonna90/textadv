extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var commands = []
var items = []
var characters = []

signal autocomplete_match(matched_string)

# Called when the node enters the scene tree for the first time.
func _ready():
	global.parser = self

func is_valid_command(identifier):
	return identifier in global._commands.keys()

func is_valid_parameter_structure(cmd, parameters):
	var cmd_obj = global._commands[cmd]
	# parameters need to have the same length as the syntax
	if len(parameters) != len(cmd_obj.syntax):
		return false
	# parameter arg_type must fit cmd arg_type
	for i in range(len(parameters)):
		if cmd_obj.syntax[i] != utils.get_string_arg_type(parameters[i]):
			return false
	return true

func is_valid_input(check_strings):
	if (len(check_strings) > 0) and !(is_valid_command(check_strings[0])):
		#print("IDENTIFIER NOT IN COMMANDS ABORT!")
		return false
		# check if parameter structure is valid
	if (len(check_strings) > 0) and !(is_valid_parameter_structure(check_strings[0], check_strings.slice(1, len(check_strings)))):
		#print("CMD STRUCTURE IS INCORRECT!")
		return false
	return true

func parse(input_string, auto_complete=false):
	""" parse input string"""
	var sub_strings = Array(input_string.split(" "))
	var check_strings = sub_strings
	if auto_complete:
		check_strings = utils.array_slice(sub_strings, 0, -1)
		# check if identifier is valid
	if is_valid_input(check_strings):
		return sub_strings
	else:
		return ["UNKNOWN"]


func _autocomplete(input_string):
	""" suggest completion for given substring """
	var candidates = []
	#TODO: use actual commands
	var comms = global._commands
	var sub_strings = parse(input_string, true)
	var sub = sub_strings[-1]
	for com in comms:
		if sub in com:
			candidates.append(com)
	emit_signal("autocomplete_match", candidates, sub_strings)

func execute_command(input_string):
	""" execute command """
	#var sub_strings = parse(input_string)
	pass
