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

static func three_list_qsort(value_list, entry_list, sub_str, start, end):
	#quicksort
	if start >= end:
		return
	var p = qsort_partition(value_list, entry_list, sub_str, start, end)
	three_list_qsort(value_list, entry_list, sub_str, start, p-1)
	three_list_qsort(value_list, entry_list, sub_str, p+1, end)

static func qsort_partition(v_array, e_array, sub_str, start, end):
	var pivot = v_array[start]
	var low = start + 1
	var high = end
	while true:
		# If the current value we're looking at is larger than the pivot
		# it's in the right place (right side of pivot) and we can move left,
		# to the next element.
		# We also need to make sure we haven't surpassed the low pointer, since that
		# indicates we have already moved all the elements to their correct side of the pivot
		while low <= high and v_array[high] >= pivot:
			high = high - 1

		# Opposite process of the one above
		while low <= high and v_array[low] <= pivot:
			low = low + 1

		# We either found a value for both high and low that is out of order
		# or low is higher than high, in which case we exit the loop
		if low <= high:
			var arr_low = v_array[low]
			v_array[low] = v_array[high]
			v_array[high] = arr_low
			
			var e_arr_low = e_array[low]
			e_array[low] = e_array[high]
			e_array[high] = e_arr_low
			
			var sub_arr_low = sub_str[low]
			sub_str[low] = sub_str[high]
			sub_str[high] = sub_arr_low
			# The loop continues
		else:
			# We exit out of the loop
			break
	var v_arr_start = v_array[start]
	v_array[start] = v_array[high]
	v_array[high] = v_arr_start
	
	var e_arr_start = e_array[start]
	e_array[start] = e_array[high]
	e_array[high] = e_arr_start
	
	var sub_arr_start = sub_str[start]
	sub_str[start] = sub_str[high]
	sub_str[high] = sub_arr_start
	return high

static func tokenize_input(string):
	# create a tuple list and sort by index
	var tokenz = []
	var tokenz_idx = []
	var sub_strings = []
	print(string)
	for key in global.game_objects.keys():
		for entry in global.game_objects[key]:
			var idx = string.find(entry.to_lower())
			if idx != -1:
				sub_strings.append(entry)
				tokenz.append(key)
				tokenz_idx.append(idx)
	print("pre sort: ", tokenz)
	three_list_qsort(tokenz_idx, tokenz, sub_strings, 0, len(tokenz)-1)
	print("after sort: ", tokenz)	
	return [tokenz, sub_strings]

static func get_string_arg_type(string):
	print(string)
	for key in global.game_objects.keys():
		print(key)
		if list_insens_match(string, global.game_objects[key]):
			return key
	return null

static func array_slice(arr : Array, start : int = 0, end : int = 0) -> Array:
	if end < 0:
		end = len(arr)+end
	var res = []
	for i in range(start, end):
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

static func list_insens_match(val, list):
	for entry in list:
		if insens_match(val, entry):
			return true
	return false

static func insens_match(val, target):
	if val.to_lower() in target.to_lower():
		return true
	return false

static func update_dict(original_dict, update_dict):
	for key in update_dict.keys():
		original_dict[key] = update_dict[key]
