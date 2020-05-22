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

func parse(input_string, auto_complete=false):
	""" parse input string"""
	#TODO: Split input by spaces.
	var sub_strings = input_string.split(" ")
	var check_strings = sub_strings
	#if execution, check all
	
	#if auto, check all until [-1]
	if auto_complete:
		check_strings = sub_strings.slice(0, -1)
	
	#TODO: if first substring is a identifier
	if !(check_strings[0] in global.COMMANDS):
		print("IDENTIFIER NOT IN COMMANDS ABORT!")
	
	#TODO: check if the following structure fits the command syntax
	
	#TODO: if so, get potential
	
	return sub_strings

func _autocomplete(input_string):
	""" suggest completion for given substring """
	var candidates = []
	#TODO: use actual commands
	var comms = global.COMMANDS
	var sub_strings = parse(input_string, true)
	var sub = sub_strings[-1]
	for com in comms:
		if sub in com:
			candidates.append(com)
	emit_signal("autocomplete_match", candidates, sub_strings)

func execute_command(input_string):
	""" execute command """
	var sub_strings = parse(input_string)
	pass
