class Location:
	""" 
	location describes the current location the player is in.
	this includes any sound files, the narrator, all characters and items
	and the location description
	"""
	var _identifier
	var _description
	var _detailed_desc
	var _sound_descr
	var _ambient_sound
	var _exits
	var _inventory
	var _characters
	signal location_enter_text(text)
	signal play_text(text_sound)
	func _init(identifier, description, detailed_desc, sound_descr, ambient_sound, items, characters):
		_identifier = identifier
		# The description of the location
		_description = description
	
		# a detailed description which might reveal some additional information with a command
		_detailed_desc = detailed_desc
		
		# the narrator reading the description
		_sound_descr = sound_descr
		
		# the ambient sound that plays in the background
		_ambient_sound = ambient_sound
		
		# set of colors to set the tone
		#var color_palette
		
		# the exit map in which ways the player can leavue the location
		_exits = {}
		
		# the items in the room
		_inventory = items
		
		# all in the room
		_characters = characters
		global.add_gameobject(global.ARG_TYPE.LOCATION, identifier)
		#self.connect("location_enter_text", self, "append_text")
	
	func _on_enter():
		print("_on_enter")
		emit_signal("location_enter_text", self._description)
	
	func _get_items():
		return self._inventory
		
	func _get_characters():
		return self._characters
	
	func _char_in_location(name):
		for chr in self._characters:
			if chr._first_name+" "+chr._last_name == name:
				return true
		return false
	
	func _get_char_in_location(name):
		for chr in self._characters:
			if chr._first_name+" "+chr._last_name == name:
				return chr
		return null	
		
	func _get_description():
		return self._description 

	func _connect_locations(direction, target):
		self._exits[direction] = target
