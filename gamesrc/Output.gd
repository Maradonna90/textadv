extends RichTextLabel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func append_user_input(user_input):
	""" append what the player has done """
	.add_text(">"+user_input)
	.newline()

func append_text(text):
	.add_text(text)
	.newline()
