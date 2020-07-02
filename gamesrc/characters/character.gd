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
	
	var _combat_actions
	# values
	var _HP
	var _AC
	signal register_character(first_name, last_name, character)
	func _init(first_name, last_name, type, STR, DEX, CON, INT, WIS, CHA, inventory, status):
		_first_name = first_name
		_last_name = last_name
		_type = type
		_inventory = inventory
		_status = status
		
		# stats - from those stats ratings are derived
		_STR = STR
		_DEX = DEX
		_CON = CON
		_INT = INT
		_WIS = WIS
		_CHA = CHA
		
		# ratings - derived from stats and used in combat
		_HP = int(0.5 * _STR + 0.5 * _CON)
		_AC = int(0.5 * _STR + 0.5 * _DEX)
		# Combat actions
		self._combat_actions = {"Attack" : null, "Ability" : null, "RUN" : null}
		global.add_gameobject(global.ARG_TYPE.CHARACTER, first_name+" "+last_name)
	
	func _has_item(item):
		for itm in self._inventory:
			if item == itm._identifier:
				return true
		return false

	func _perform_combat_action(action, target):
		for combat_type_actions in self._combat_actions.values():
			for type_action in combat_type_actions:
				if action.lower() == type_action.identifier:
					type_action.execute(self, target)
					return
