extends Node

#all important nodes
onready var output
onready var player
onready var comba_sel

# directions we can exit a location
var DIRECTION = ["north", "south", "west", "east", "leave"]

#basic non-combat commands
#enum COMMANDS {GO, ASK, TAKE, GIVE, LOOK}

# commands during combat
#enum COMBAT_COMMANDS {ATTACK, DEFEND, DODGE, ABILITY, RUN}

#ability modifiers
var ability_mods = {1 : -5, 2 : -4, 3 : -4, 4 : -3, 5 : -3, 6 : -2, 7 : -2, 8 : -1,
	9 : -1, 10 : 0, 11 : 0, 12 : 1, 13 : 1, 14 : 2, 15 : 2, 16 : 3, 17 : 3, 18 : 4, 19 : 4, 20 : 5}

#parameter types
enum ARG_TYPE {IDENTIFIER, DIRECTION, CHARACTER, ITEM, LOCATION}
var game_objects = {}
# IDENTIFIER -> Basic Commands
# DIRECTION -> DIRECTION
# CHARACTER -> ask character in the room (use name as identifier, first_name)
# ITEM -> item in inventory OR room

#char status
enum CHAR_TYPE {PLAYER, NPC}

#TODO: we need all valid commands in one list.

#TODO: create command objects
onready var go = preload("commands/GO.gd").Go.new()
onready var ask = preload("commands/ASK.gd").Ask.new()
onready var take = preload("commands/TAKE.gd").Take.new()
onready var give = preload("commands/GIVE.gd").Give.new()
onready var look = preload("commands/LOOK.gd").Look.new()
onready var talk = preload("commands/TALK.gd").Talk.new()
onready var textFormatter = load("textFormatter.gd").TextFormatter.new("#ff5b6a", "#f7d66a", "#9eb2b4", "#8acd8f")

onready var atk = preload("commands/ATTACK.gd").Attack.new()
onready var run = preload("commands/RUN.gd").Run.new()
onready var macig_missiles = preload("commands/abilities/MAGIC_MISSILES.gd").Magic_Missiles.new()

onready var _commands = {go.identifier : go, ask.identifier : ask,
 take.identifier : take, give.identifier : give, look.identifier : look, talk.identifier : talk}

onready var current_location = null

#Reference to optional classes
var dice = preload("Dice.gd").Dice
var combat = preload("Combat.gd").Combat

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
	
func after_command_checks():
	print("check after exec")
	#check if someone in the same location is aggro, if so trigger combat
	var combat_chars = []
	for chr in global.current_location._get_characters():
		print("aggro: ", chr._status['aggro'])
		if chr._status['aggro']:
			combat_chars.append(chr)
	if combat_chars:
		print("try create combat")
		global.combat.new([global.player], combat_chars).main_loop()

func _ready():
	print("global ready")
	for en in ARG_TYPE:
		game_objects[en] = []
	game_objects["DIRECTION"] = DIRECTION
	game_objects["IDENTIFIER"] = _commands.keys()
