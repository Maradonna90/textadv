extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var commands = []
var items = []
var characters = []



# Called when the node enters the scene tree for the first time.
func _ready():
	global.parser = self

func parse(input_string):
	print(input_string)
	#TODO: Split input by spaces.
	var sub_strings = input_string.split(" ")
	""" parse input string"""
	pass

func _autocomplete(input_string):
	print("auto", input_string)
	""" suggest completion for given substring """
	pass

func execute_command():
	""" execute command """
	pass
