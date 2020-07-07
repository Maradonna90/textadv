class Non_player extends "res://characters/character.gd".Character:	
	func _init(first_name, last_name, type, STR, DEX, CON, INT, WIS, CHA, inventory, combat_actions = {}).(first_name, last_name, type, STR, DEX, CON, INT, WIS, CHA, inventory, combat_actions):
		pass
		
	func choose_action(targets):
		print("AI choose action!")
		var actions = ["Attack", "Ability"]
		print(randi() % actions.size())
		var action_key = actions[randi() % actions.size()]
		var action_list = self._combat_actions[action_key]
		var action = action_list[randi() % action_list.size()]
		var target = targets[randi() % targets.size()]
		action._execute(self, target)
