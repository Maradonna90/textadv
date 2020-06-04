extends Node

signal autocomplete_match(matched_string)

func is_valid_command(identifier):
	return identifier in global._commands.keys()

func is_valid_parameter_structure(cmd, parameters):
	print("is_valid_parameter_structure: ", cmd, parameters)
	var cmd_obj = global._commands[cmd]
	# parameters need to have the same length as the syntax
	if len(parameters) != len(cmd_obj.syntax):
		return false
	# parameter arg_type must fit cmd arg_type
	for i in range(len(parameters)):
		print(cmd_obj)
		print("syntax: ", cmd_obj.syntax[i])
		var cmds = []
		for synt in cmd_obj.syntax[i]:
			print("syntax: ", synt)
			cmds.append(global.ARG_TYPE.keys()[synt])
		var par_arg = utils.get_string_arg_type(parameters[i])
		if !(par_arg in cmds):
			return false
	return true

func is_valid_input(check_strings):
	print("is_valid_input: ", check_strings)
	if (len(check_strings) > 0) and !(is_valid_command(check_strings[0])):
		print("IDENTIFIER NOT IN COMMANDS ABORT!")
		return false
		# check if parameter structure is valid
	if (len(check_strings) > 1) and !(is_valid_parameter_structure(check_strings[0], utils.array_slice(check_strings, 1, len(check_strings)))):
		print("CMD STRUCTURE IS INCORRECT!")
		return false
	return true

func parse(input_string, auto_complete=false):
	""" parse input string"""
	input_string = input_string.to_lower()
	var sub_strings = Array(input_string.split(" "))
	var check_strings = sub_strings
	if auto_complete:
		check_strings = utils.array_slice(sub_strings, 0, -1)
		# check if identifier is valid
	print(check_strings)
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
	print("_autocomplete: ", sub_strings)
	var sub = sub_strings[-1]
	# at what position are we autocompleting?
	var pos = len(sub_strings) - 2
	# what are the syntactically correct candidates
	if len(sub_strings) > 1:
		print("argtype: ", sub)
		var cmd_obj = global._commands[sub_strings[0]]
		for synt in cmd_obj.syntax[pos]:
			synt = global.ARG_TYPE.keys()[synt]
			for g_obj in global.game_objects[synt]:
				if sub in g_obj:
					candidates.append(g_obj)
				elif sub == "":
					candidates.append(g_obj)
	else:
		for cmd in global._commands.keys():
			if sub in cmd:
				candidates.append(cmd)
	emit_signal("autocomplete_match", candidates, sub_strings)

func execute_command(input_string):
	""" execute command """
	var sub_strings = parse(input_string)
	if sub_strings == ["UNKNOWN"]:
		return
	var cmd = global._commands[sub_strings[0]]
	var parameters = sub_strings.slice(1, len(sub_strings))
	cmd._execute(parameters)
