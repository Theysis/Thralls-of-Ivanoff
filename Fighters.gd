extends TurnQueue

class_name Fighters

# Defines variables for character stats
var pName : String = ""
var st : int = 0 # Strength Stat
var agil : int = 0  # Agility
var def : int = 0 # Defence
var intel : int = 0 # Intelligence
var maxHP : int = 0 # Health
var maxMP : int = 0 # Magic Points / Ability Points
var align : int = 0 # Defines good or evil (evil = 0, good = 1)

# Creates the fighter with the specified skills
func intitialize() :
	var fighter = [pName, maxHP, maxMP, st, agil, def, intel]
	


# Sets the fighter on the specified side. Left if villain, right if hero
func appear() :
	pass

# Defines the actions the fighter can take. For now, focus on a basic attack action
func combat_action() :
	pass

