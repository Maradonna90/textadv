class Character extends Node:
	func _init(first_name, last_name, type, STR, DEX, CON, INT, WIS, CHA, items, status):
		var _first_name = first_name
		var _last_name = last_name
		var _type = type
		var _items = items
		var _status = status
		
		# stats
		var _STR = STR
		var _DEX = DEX
		var _CON = CON
		var _INT = INT
		var _WIS = WIS
		var _CHA = CHA
		
		# values
		var _HP = 0.5 * _STR + 0.5 * _CON
