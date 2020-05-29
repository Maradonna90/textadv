extends RichTextLabel

func _ready():
	print("output ready")
	global.output = self

func append_user_input(user_input):
	""" append what the player has done """
	.add_text(">"+user_input)
	.newline()

func append_text(text):
	text = global.textFormatter.color_output(text)
	print("append_text")
	.append_bbcode(text)
	#.add_text(text)
	.newline()
