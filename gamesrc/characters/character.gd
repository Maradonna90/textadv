class Character extends Node:
	var _first_name
	var _last_name
	var _type
	var _inventory
	var _status
	
	# stats
	var _STR
	var _DEX
	var _CON
	var _INT
	var _WIS
	var _CHA
	
	# values
	var _HP
	signal register_character(first_name, last_name, character)
	func _init(first_name, last_name, type, STR, DEX, CON, INT, WIS, CHA, inventory, status):
		_first_name = first_name
		_last_name = last_name
		_type = type
		_inventory = inventory
		_status = status
		
		# stats
		_STR = STR
		_DEX = DEX
		_CON = CON
		_INT = INT
		_WIS = WIS
		_CHA = CHA
		
		# values
		_HP = 0.5 * _STR + 0.5 * _CON
		global.add_gameobject(global.ARG_TYPE.CHARACTER, first_name+" "+last_name)
