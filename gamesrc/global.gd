extends Node

var parser
var player
var input

# directions we can exit a location
enum DIRECTION {NORTH, SOUTH, WEST, EAST, LEAVE}

#basic non-combat commands
enum COMMANDS {GO, ASK, TAKE, GIVE, LOOK}

# commands during combat
enum COMBAT_COMMANDS {ATTACK, DEFEND, DODGE, ABILITY, RUN}

#parameter types
enum ARG_TYPE {IDENTIFER, DIRECTION, COMBAT, CHARACTER, ITEM}

#char status
enum STATUS {ALIVE, DEAD}

#TODO: we need all valid commands in one list.


