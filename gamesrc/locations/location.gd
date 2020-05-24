class Location extends Node:
	""" 
	location describes the current location the player is in.
	this includes any sound files, the narrator, all characters and items
	and the location description
	"""
	signal print_text(text)
	signal play_text(text_sound)
	func _init(description, sound_descr, ambient_sound, exits, items, characters):
		# The description of the location
		var _descripton = description
	
		# the narrator reading the description
		var _sound_descr = sound_descr
		
		# the ambient sound that plays in the background
		var _ambient_sound = ambient_sound
		
		# set of colors to set the tone
		#var color_palette
		
		# the exit map in which ways the player can leavue the location
		var _exits = exits
		
		# the items in the room
		var _items = items
		
		# all in the room
		var _characters = characters
	
	func _ready():
		global.current_location = self
		_on_enter()
	
	func _on_enter():
		emit_signal("print_text", self.descripton)
	
	func _get_items():
		return self._items
		
	func _get_characters():
		return self._characters
