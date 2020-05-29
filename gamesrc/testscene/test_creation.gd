extends Node
var start
#init
func _ready():
	print("test_ready")
	# load interfaces
	var _location = load("locations/location.gd").Location
	var _item = load("items/item.gd").Item
	var _character = load("characters/character.gd").Character
	
	# create locations, items and characters
	
	#create starting location
	var name = "The Starting Point"
	var desc = "Welcome to TextAdv. A marvelous adventure narrated and created by me!\nTry stuff out. There is a Sword in the Ghodrin Cave. Thorgar Meltar awaits you here."
	var loot = []
	var chars = [_character.new("Thorgar", "Meltar", global.CHAR_TYPE.NPC,
												10, 12, 9, 8, 10, 16, null, global.STATUS.ALIVE)]
	start = _location.new(name, desc, null, null, 
								["north"], loot, chars)
	
	#create second location
	name = "Ghodrin Cave"
	desc = "You are in a big cave, water is running somwhere."
	loot = [_item.new("Sword", "A regular sword.", 1.0, null)]
	chars = []
	_location.new(name, desc, null, null, ["south"], loot, chars)
	
	#create items
	global.change_location(start)
