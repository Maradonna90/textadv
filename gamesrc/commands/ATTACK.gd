class Attack extends "res://commands/command.gd":
	""" ask a character about another character/location """
	var identifier
	var syntax
	func _init():
		identifier = "attack"
	
	func _execute(source, target):
		""" source performs an attack attempt on target """
		# Determine if source hits target
		var attack_roll = global.dice.new(20).roll()
		var attack_mod = global.ability_mods[source._STR]
		var final_attack = attack_mod + attack_roll
		if final_attack >= target._AC:
			#roll for damage
			var damage_roll = global.dice.new(6).roll() + global.ability_mods[source._STR]
			target.receive_dmg(damage_roll)
		else:
			print("Attack misses!")
