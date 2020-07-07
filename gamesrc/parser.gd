extends Node

signal autocomplete_match(matched_string)

func is_valid_command(identifier):
	#TODO: refactor
	return identifier in global._commands.keys()

func is_valid_parameter_structure(cmd, parameters, auto_complete):
	#TODO: refactor
	print("is_valid_parameter_structure: ", cmd, parameters)
	var cmd_obj = global._commands[cmd]
	# parameters need to have the same length as the syntax
	if !auto_complete and (len(parameters) != len(cmd_obj.syntax)):
		return false
	# parameter arg_type must fit cmd arg_type
	for i in range(len(parameters)):
		print(cmd_obj)
		print("syntax: ", cmd_obj.syntax[i])
		var cmds = []
		for synt in cmd_obj.syntax[i]:
			print("syntax: ", synt)
			cmds.append(global.ARG_TYPE.keys()[synt])
		var par_arg = parameters[i]
		if !(par_arg in cmds):
			return false
	return true

func is_valid_input(token_strings, tokenz, auto_complete):
	print("is_valid_input: ", token_strings)
	#TODO: check wether the if works as intended
	if (len(token_strings) > 0) and !(tokenz[0] == global.ARG_TYPE.keys()[global.ARG_TYPE.IDENTIFIER]):
		print("FIRST TOKEN NOT A COMMAND. ABORT!")
		return false
		# check if parameter structure is valid
	if (len(token_strings) > 1) and !(is_valid_parameter_structure(token_strings[0], tokenz.slice(1, len(tokenz)-1), auto_complete)):
		print("CMD STRUCTURE IS INCORRECT!")
		return false
	return true

func parse(input_string, auto_complete=false):
	""" parse input string"""
	input_string = input_string.to_lower()
	var token_input = utils.tokenize_input(input_string)
	var tokenz = token_input[0]
	var token_strings = token_input[1]
	print("input_str: ", input_string)
	print("tokenized: ", tokenz)
	print("token_str: ", token_strings)
	var input_sub_strings = Array(input_string.split(" "))
	var check_strings = input_sub_strings
	#if auto_complete:
		#TODO: recheck
	#	check_strings = utils.array_slice(input_sub_strings, 0, -1)
		# check if identifier is valid
	print("sub_str: ", check_strings)
	if is_valid_input(token_strings, tokenz, auto_complete):
		return [tokenz, token_strings, check_strings]
	else:
		return [["UNKNOWN"], [null], [null]]


func _autocomplete(input_string):
	""" suggest completion for given substring """
	var candidates = []
	#TODO: use actual commands
	var comms = global._commands
	var parse_out = parse(input_string, true)
	var token_string = parse_out[1]
	var tokenz = parse_out[0]
	var sub_strings = parse_out[2]
	print("_autocomplete: ", sub_strings)
	if sub_strings == [null]:
		return
	var sub = sub_strings[-1]
	# at what position are we autocompleting?
	var pos = max(0, len(tokenz)-1)
	print("pos: ", pos)
	# what are the syntactically correct candidates
	if len(sub_strings) > 1:
		print("argtype: ", sub)
		var cmd_obj = global._commands[token_string[0]]
		if len(tokenz)-1 == len(cmd_obj.syntax):
			return
		for synt in cmd_obj.syntax[pos]:
			synt = global.ARG_TYPE.keys()[synt]
			print("synt: ", synt)
			for g_obj in global.game_objects[synt]:
				print("g_obj: ", g_obj)
				if sub in g_obj.to_lower():
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
	var parse_out = parse(input_string)
	var token_string = parse_out[1]
	var tokenz = parse_out[0]
	var sub_strings = parse_out[2]
	if tokenz == ["UNKNOWN"]:
		return
	var cmd = global._commands[token_string[0]]
	var parameters = token_string.slice(1, len(token_string)-1)
	cmd._execute(parameters)
	# DO ALL AFTER CHECKS TO SEE IF AN EVENT SHOULD BE TRIGGERED
	global.after_command_checks()
