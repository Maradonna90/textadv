class Item:
	var _identifier
	var _description
	var _value
	var _modifiers
	var _visible
	func _init(identifier, description, value, modifiers, visible=true):
		print("create item")
		_identifier = identifier
		_description = description
		_value = value
		_modifiers = modifiers
		_visible = visible
		global.add_gameobject(global.ARG_TYPE.ITEM, self._identifier)
	
	func _get_description():
		return self._description 
