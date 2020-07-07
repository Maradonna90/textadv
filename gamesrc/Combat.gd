class Combat:
	var _party1
	var _party2
	var _queue
	var _state
	
	enum STATE {START, COMBAT, END}
	
	signal request_selection(player, targets)
	
	func _init(party1, party2):
		_party1 = party1
		_party2 = party2
		_state = self.STATE.START
		#self signal, target, target func
		print("Create Combat class")
		self.connect("request_selection", global.comba_sel, "received_player")
	func _create_init_queue(participants):
		#TODO roll initiative to determine order of actions
		var dice = global.dice.new(20)
		var order = []
		var init_rolls = []
		for chr in participants:
			var roll = dice.roll()
			var final_init = global.ability_mods[chr._DEX] + roll
			if order.empty():
				order.append(chr)
				init_rolls.append(final_init)
			else:
				for i in range(len(init_rolls)):
					if final_init > init_rolls[i]:
						order.insert(i, chr)
						init_rolls.insert(i, final_init)
						break
					elif final_init <= init_rolls[i] and i == len(init_rolls)-1:
						order.append(chr)
						init_rolls.append(final_init)
		return order
				
	func main_loop():
		print("START COMBAT!")
		#TODO: Main loop to resolve combat
		# create init queue
		self._queue = self._create_init_queue(self._party1+self._party2)
		self._state = self.STATE.COMBAT
		while self._state == self.STATE.COMBAT:
			for chr in self._queue:
				#IF Player, ask for action
				if chr._type == global.CHAR_TYPE.PLAYER:
					# CREATE BUTTONS
					emit_signal("request_selection", chr, self._party1+self._party2)
				else:
					chr.choose_action(self._party2)
				#ELSE do AI calculation and perform action
				pass
			self._state = self.STATE.END
		#take combat turns
