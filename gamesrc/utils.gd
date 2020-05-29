extends Node
static func array_join(arr : Array, glue : String = '') -> String:
	var string : String = ''
	for index in range(0, arr.size()):
		string += str(arr[index])
		if index < arr.size() - 1:
			string += glue
	return string

static func check_parameters(parameter, length, types):
	if len(parameter) != length:
		return false
	for i in range(len(types)):
		if types[i] != parameter[i].type:
			return false
	return true

static func get_string_arg_type(string):
	var obj = global.game_objects
	for key in global.game_objects.keys():
		print(key)
		if string in global.game_objects[key]:
			return key
	return null


static func array_slice(arr : Array, start : int = 0, end : int = 0) -> Array:
	if end < 0:
		end = len(arr)+end
	var res = []
	for i in range(end):
		res.append(arr[i])
	return res
	
static func get_item_by_name(item_name):
	var location = global.current_location
	var items = location._get_items()
	var chars = location._get_characters()
	
	for chr in chars:
		for item in chr.get_inventory():
			if item._identifier == item_name:
				return item
	for item in items:
		if item._identifier == item_name:
				return item
	return null
	
static func get_character_by_name(char_name):
	var chars = global.current_location._get_characters()
	for chr in chars:
		if chr._first_name == char_name:
				return chr
	return null
