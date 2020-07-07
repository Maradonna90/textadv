extends Node
var start
#init
func _ready():
	print("test_ready")
	# load interfaces
	var _location = load("locations/location.gd").Location
	var _item = load("items/item.gd").Item
	var _character = load("characters/character.gd").Character
	var _non_player = load("characters/non_player.gd").Non_player
	
	#create player
	global.player = _character.new("Hans", "Wurst", global.CHAR_TYPE.PLAYER,
												10, 12, 9, 8, 10, 16, [])
	
	# create locations, items and characters
	
	#create starting location
	var name = "Start"
	var desc = "Welcome to TextAdv. A marvelous adventure narrated and created by me!\nTry stuff out. There is a Sword in the Ghodrin Cave. Thorgar Meltar awaits you here."
	var detail = "A detailed description of start"
	var loot = []
	var chars = [_non_player.new("Thorgar", "Meltar", global.CHAR_TYPE.NPC,
												10, 12, 9, 8, 10, 16, [])]
	start = _location.new(name, desc, detail, null, null, 
								loot, chars)
	
	#create second location
	name = "Ghodrin Cave"
	desc = "You are in a big cave, water is running somwhere."
	detail = "A more detailed desc"
	loot = [_item.new("Sword", "A regular sword.", 1.0, null)]
	chars = []
	var end = _location.new(name, desc, detail, null, null, loot, chars)
	
	#create third location
	name = "Crow Forest"
	desc = "A dark needletree forest."
	detail = "You see some crows and wolfs crying out loud."
	loot = []
	chars = [_non_player.new("Sven", "Szentar", global.CHAR_TYPE.NPC,
												10, 12, 9, 8, 10, 16, [])]
	chars[0].set_status("aggro", true)
	var fight = _location.new(name, desc, detail, null, null, loot, chars)
	
	#create location connections
	start._connect_locations("south", end)
	end._connect_locations("north", start)
	start._connect_locations("west", fight)
	fight._connect_locations("east", start)
	
	global.change_location(start)
