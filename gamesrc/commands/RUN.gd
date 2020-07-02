class Run extends "res://commands/command.gd":
	""" run from a fight and escape """
	var identifier
	var syntax
	func _init():
		identifier = "run"
	
	func _execute(source):
		""" source performs an escape attempt """
		# Determine if source hits target
		var run_roll = global.dice.new(20).roll()
		var run_mod = global.ability_mods[source._DEX]
		var final_run = run_mod + run_roll
		if final_run >= 17:
			#get out of combat
			pass
		else:
			print("Run fails!")
