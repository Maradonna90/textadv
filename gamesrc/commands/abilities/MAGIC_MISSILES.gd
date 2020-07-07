class Magic_Missiles extends "res://commands/command.gd":
	var identifier
	var syntax
	func _init():
		identifier = "magic_missiles"
	
	func _execute(source, target):
		#TODO
		""" source performs magic missiles on target """
		# Determine if source hits target
		var attack_roll = global.dice.new(20).roll()
		var attack_mod = global.ability_mods[source._INT]
		var final_attack = attack_mod + attack_roll
		if final_attack >= target._AC:
			#roll for damage
			var damage_roll = global.dice.new(6).roll() + global.ability_mods[source._INT]
			target.receive_dmg(damage_roll)
		else:
			print(self.identifier+" misses!")
