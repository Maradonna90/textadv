# Structure
* Parser
	* has autocomplete
		* when autocomplete is triggered
			* show suggestion in an area below
			* let user cycle through all suggestion with TAB
			* user can confirm selection with ENTER
	* tokenizes input (?)
* TextFormatter
	* Colorschemes for specific texts
		* Common Text
		* usable action
		* valid action (but not usable right now)
		* character Names
		* interesting objects
* Character
	* HP
	* Name
	* Str - How hard you can punch
	* Dex - How fast you can punch
	* Con - How many times you can be punched
	* Int - Knowing how to punch
	* Wis - Knowing where to punch
	* Cha - Convincing someone to let you punch them
* Dice
	* range: what range the dice has
* Command
	* Common
		* GO
		* TAKE
		* GIVE
	* Combat
		* ATTACK
		* ABILITY
		* DEFEND
		* DODGE
* Dialog
	* answers: alle the possible answers
	* branches: branching in dialog

* Theming
	* Reference the colors like in terminal usage somewhere (will make theming easier)

# Text-processing pipeline
Input -> Parser -> TextFormatter -> Input

## When typing
Parser splits into substrings, check the substrings if they match something, if so, color it	

## when autocomplete
Parser splits into substrings, check last substring for an autocomplete and make suggestion/replace

## when confirming
Parser splits into substrings, checks first substring if it matches a command, and check if the other types fit the syntax

## who has what
global must have all commands in a list
global knows the current location
global 
