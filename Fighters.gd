extends TurnQueue

class_name Fighters

# Defines variables for character stats
var name : String = ""
var st : int = 0 # Strength Stat
var agil : int = 0  # Agility
var def : int = 0 # Defence
var intel : int = 0 # Intelligence
var MaxHP : int = 0 # Health
var MaxMP : int = 0 # Magic Points / Ability Points


func intitialize() :
	var fighter = [name, MaxHP, MaxMP, st, agil, def, intel]


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func combat_action() :
	pass
