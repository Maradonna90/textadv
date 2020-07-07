class Character:
	var _first_name
	var _last_name
	var _type
	var _inventory
	
	# stats
	var _STR
	var _DEX
	var _CON
	var _INT
	var _WIS
	var _CHA
	
	# values
	var _HP
	var _AC
	
	var _combat_actions = {"Attack" : [global.atk], "Ability" : [null], "Run" : [global.run]}
	var _status = {"alive": true, "aggro": false}
	signal register_character(first_name, last_name, character)
	func _init(first_name, last_name, type, STR, DEX, CON, INT, WIS, CHA, inventory, combat_actions = {}):
		_first_name = first_name
		_last_name = last_name
		_type = type
		_inventory = inventory
		
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
		#self._combat_actions = {"Attack" : null, "Ability" : null, "Run" : null}
		utils.update_dict(_combat_actions, combat_actions)
		global.add_gameobject(global.ARG_TYPE.CHARACTER, first_name+" "+last_name)
	
	func set_status(name, value):
		self._status[name] = value
	
	func get_status(name):
		return self._status[name]
	
	func _has_item(item):
		for itm in self._inventory:
			if item == itm._identifier:
				return true
		return false
		
	func receive_dmg(value):
		self._HP -= value

	func _perform_combat_action(action, target):
		for combat_type_actions in self._combat_actions.values():
			for type_action in combat_type_actions:
				if action.lower() == type_action.identifier:
					type_action._execute(self, target)
					return
