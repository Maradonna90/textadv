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

