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

func parse(input_string):
	""" parse input string"""
	#TODO: Split input by spaces.
	var sub_strings = input_string.split(" ")
	return sub_strings

func _autocomplete(input_string):
	""" suggest completion for given substring """
	var candidates = []
	var comms = ["ask", 'go', 'give']
	var sub_strings = parse(input_string)
	var sub = sub_strings[-1]
	for com in comms:
		if sub in com:
			candidates.append(com)
	emit_signal("autocomplete_match", candidates)

func execute_command():
	""" execute command """
	pass
