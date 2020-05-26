class Item:
	func _init(identifier, description, value, modifiers, visible=true):
		var _identifier = identifier
		var _description = description
		var _value = value
		var _modifiers = modifiers
		var _visible = visible
	
	func _get_description():
		return self._description 
