class Location:
	""" 
	location describes the current location the player is in.
	this includes any sound files, the narrator, all characters and items
	and the location description
	"""
	var _name
	var _description
	var _sound_descr
	var _ambient_sound
	var _exits
	var _items
	var _characters
	signal location_enter_text(text)
	signal play_text(text_sound)
	func _init(name, description, sound_descr, ambient_sound, exits, items, characters):
		_name = name
		# The description of the location
		_description = description
	
		# the narrator reading the description
		_sound_descr = sound_descr
		
		# the ambient sound that plays in the background
		_ambient_sound = ambient_sound
		
		# set of colors to set the tone
		#var color_palette
		
		# the exit map in which ways the player can leavue the location
		_exits = exits
		
		# the items in the room
		_items = items
		
		# all in the room
		_characters = characters
		global.add_gameobject(global.ARG_TYPE.LOCATION, name)
		#self.connect("location_enter_text", self, "append_text")
	
	func _on_enter():
		print("_on_enter")
		emit_signal("location_enter_text", self._description)
	
	func _get_items():
		return self._items
		
	func _get_characters():
		return self._characters
		
	func _get_description():
		return self._description 
