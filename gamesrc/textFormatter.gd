class TextFormatter extends Node:
	signal formatted_text(text)
	var _colors
	var bbcode_color = "[color=colorcode]{text}[/color]"
	func _init(item_color, character_color, location_color, command_color):
		_colors = {"IDENTIFER" : command_color, "DIRECTION" : command_color, 
					"CHARACTER" : character_color, "ITEM" : item_color, "LOCATION" : location_color}
		
	func color_output(text):
		for key in global.game_objects.keys():
			for val in global.game_objects[key]:
				if val in text:
					var color = self._colors[key]
					var color_sub = self.bbcode_color.replace("colorcode", color)
					color_sub = color_sub.replace("{text}", val)
					text = text.replace(val, color_sub)
		return text
