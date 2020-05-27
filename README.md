CREATE TICKETS TO KEEP TRACK AND CREATE UML AND WORKFLOW FOR GAMELOOP

# Features
	* Parser/Input
		* have a bar that displays the current status (Name of location, Ingame-Day(time), )
		* check for valid input (syntactically and semantically)
		* autocomplete
		* Syntax highlighting
		* selective autocomplete
	* TextFormatter
		* highlights output text depending on type
	* Puzzles
	* MiniGames
		* create a board game that works a bit like chess, but simpler
	* Characters
		* NPC/Player
		* stats based on D&D
		* Have inventory
	* Dice
		* rolling a dices is animated
	* Dialog
		* Dialogs with options
		* Some options are based on conditions
		* sometimes there is a timelimit to choose a option (random otherwise)
	* Editor
		* save rooms in JSON etc.
		* organize whole story in a graph-like structure
		* create scripting language for room creation
			* HOW TO DO DIALOG BRANCHING?
			* should support descriptions for under specific condition
			* dialog options
	* Commands
		* identifier: keyword which identifies the command
		* syntax: allowed command structure
		* execution: what is done after all sanity checks

# Game Loop
1. User Input: User gives a valid input
2. Player Object executes instructions
3. NPC execute behaviour
	3.1 If in Combat, Dialog or MiniGame go to 1.
4. ALL timers process one tick (bombs, etc pp)
5. Wait for next input

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
