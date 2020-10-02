extends BattleArena


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
class_name TurnQueue

onready var activeCharacter

func initialize():
	var fighters = getParty()
	Fighters.sort_custom(self, 'sort_battlers')
	for fighter in Fighters :
		fighter.raise()
	activeCharacter = get_child(0)

static func sort_Fighters(a : Fighters, b : Fighters) -> bool:
	return a.agil > b.agil

func current_turn(target : Fighters, action): 
	yield(activeCharacter.current_turn(), "completed")
	action.execute(self, target)
	var new_index : int = (activeCharacter.get_index() + 1) % get_child_count() 
	activeCharacter = get_child(new_index)
	

# Establishes order of Fighters
func print_queue() :
	var string : String
	for fighter in get_children():
		string += fighter.name + "(%s)" % fighter.agil + " "
	print(string)

func skipTurn() :
	nextFighter()

func nextFighter() :
	var nextBattlerIndex : int = (activeCharacter.get_index() + 1) % get_child_count()
	activeCharacter = get_child(nextBattlerIndex)
	.emit_signal('queue_changed', getFighter(), activeCharacter)
	
func getParty() -> Array:
	return .getParty()

func getMonsters() :
	return getTargets(false)

func getFighter() :
	return get_children()

func getTargets(in_party: bool = false) -> Array:
	var targets: Array = []
	for child in get_children():
			if child.party_member == in_party && child.MaxHP > 0:
					targets.append(child)
	return targets

func get_child(var o : int) :
	.get_child(o)

func get_child_count() :
	.get_child_count();

func get_children() :
	.get_children();

