extends Node

#all important nodes
onready var output
onready var player

# directions we can exit a location
var DIRECTION = ["north", "south", "west", "east", "leave"]

#basic non-combat commands
#enum COMMANDS {GO, ASK, TAKE, GIVE, LOOK}

# commands during combat
#enum COMBAT_COMMANDS {ATTACK, DEFEND, DODGE, ABILITY, RUN}

#parameter types
enum ARG_TYPE {IDENTIFIER, DIRECTION, CHARACTER, ITEM, LOCATION}
var game_objects = {}
# IDENTIFIER -> Basic Commands
# DIRECTION -> DIRECTION
# CHARACTER -> ask character in the room (use name as identifier, first_name)
# ITEM -> item in inventory OR room

#char status
enum STATUS {ALIVE, DEAD}
enum CHAR_TYPE {PLAYER, NPC}

#TODO: we need all valid commands in one list.

#TODO: create command objects
onready var go = preload("commands/GO.gd").Go.new()
onready var ask = preload("commands/ASK.gd").Ask.new()
onready var take = preload("commands/TAKE.gd").Take.new()
onready var give = preload("commands/GIVE.gd").Give.new()
onready var look = preload("commands/LOOK.gd").Look.new()
onready var textFormatter = load("textFormatter.gd").TextFormatter.new("#ff5b6a", "#f7d66a", "#9eb2b4", "#8acd8f")

onready var _commands = {go.identifier : go, ask.identifier : ask,
 take.identifier : take, give.identifier : give, look.identifier : look}

onready var current_location = null

func change_location(location):
	self.current_location = location
	self.current_location.connect("location_enter_text", output, "append_text")
	self.current_location._on_enter()
	
func transfer_item(source, target, item):
	print("transfer_item: ", item)
	for source_item in source._inventory:
		print("source_item: ", source_item._identifier)
		if source_item._identifier.to_lower() == item.to_lower():
			#remove item from source inv
			source._inventory.erase(source_item)
			#put item into target inv
			target._inventory.append(source_item)
			return true
	return false

func add_gameobject(type, identifier):
	var identifier_string = global.ARG_TYPE.keys()[type]
	game_objects[identifier_string].append(identifier)

func _ready():
	print("global ready")
	for en in ARG_TYPE:
		game_objects[en] = []
	game_objects["DIRECTION"] = DIRECTION
	game_objects["IDENTIFIER"] = _commands.keys()
