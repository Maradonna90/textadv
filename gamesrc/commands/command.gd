class Command:
	# Command name, ex: "GO", "GIVE", "SEE"
	var identifier
	
	# ex: [IDENTIFIER] [DIRECTION]
	# ex2: [IDENTIFIER] [CHARACTER] [ITEM], "GIVE INNKEEPER GOLD"
	var syntax
	
	signal error(text)
	
	func _execute(parameters):
		""" execute the command with the given parameters """
		pass
