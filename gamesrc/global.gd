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
enum ARG_TYPE {IDENTIFER, DIRECTION, CHARACTER, ITEM}
# IDENTIFIER -> Basic Commands
# DIRECTION -> DIRECTION
# CHARACTER -> ask character in the room (use name as identifier, first_name)
# ITEM -> item in inventory OR room

#char status
enum STATUS {ALIVE, DEAD}
enum CHAR_TYPE {PLAYER, NPC}

#TODO: we need all valid commands in one list.

#TODO: create command objects
onready var go = preload("commands/GO.gd").new()
onready var ask = preload("commands/ASK.gd").new()
onready var take = preload("commands/TAKE.gd").new()
onready var give = preload("commands/GIVE.gd").new()
onready var look = preload("commands/LOOK.gd").new()

onready var _commands = {go.identifier : go, ask.identifier : ask,
 take.identifier : take, give.identifier : give, look.identifier : look}

onready var current_location = null

func change_location(location_name):
	self.current_location = load("locations/"+location_name+".gd").new()
	
func transfer_item(source, target, item):
	pass
