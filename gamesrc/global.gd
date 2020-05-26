extends Node


var parser
var player
var input

# directions we can exit a location
var DIRECTION = ["NORTH", "SOUTH", "WEST", "EAST", "LEAVE"]

#basic non-combat commands
#enum COMMANDS {GO, ASK, TAKE, GIVE, LOOK}

# commands during combat
#enum COMBAT_COMMANDS {ATTACK, DEFEND, DODGE, ABILITY, RUN}

#parameter types
enum ARG_TYPE {IDENTIFER, DIRECTION, CHARACTER, ITEM, LOCATION}
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


onready var _commands = {go.identifier : go, ask.identifier : ask,
 take.identifier : take, give.identifier : give, look.identifier : look}

onready var current_location = null

func change_location(location_name):
	#self.current_location = load("locations/"+location_name+".gd").new()
	self.current_location = load("locations/location.gd").new()
	
func transfer_item(source, target, item):
	pass
	
#init
func _ready():
	var desc = "Welcome to TextAdv. A marvelous adventure narrated and created by me! \n Try stuff out."
	var loot = [load("items/item.gd").Item.new("Sword", "A regular sword.", 1.0, null)]
	var chars = [load("characters/character.gd").Character.new("Thorgar", "Meltar", self.CHAR_TYPE.NPC,
												10, 12, 9, 8, 10, 16, null, self.STATUS.ALIVE)]
	self.current_location = load("locations/location.gd").Location.new(desc, null, null, ["NORTH", "SOUTH"], loot, chars)
