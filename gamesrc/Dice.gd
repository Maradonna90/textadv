class Dice:
	var _sides
	
	func _init(sides):
		_sides = sides
	
	func roll():
		return randi()%self._sides+1
