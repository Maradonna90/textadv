extends Node
""" 
location describes the current location the player is in.
this includes any sound files, the narrator, all characters and items
and the location description
"""

# The description of the location
var descripton = "You are in a dark forest, surrounded by vile creatures."

# the narrator reading the description
var sound_descr

# the ambient sound that plays in the background
var ambient_sound 

# set of colors to set the tone
var color_palette

# the exit map in which ways the player can leavue the location
var exits

# the items in the room
var items

# the npc in the room
var npcs

# signals to other objects
signal print_text(text)
signal play_text(text_sound)

func _ready():
	_on_enter()

func _on_enter():
	emit_signal("print_text", self.descripton)
