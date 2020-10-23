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
var align : int # Defines good or evil (evil = 0, good = 1)


# Creates the fighter with the specified skills
func intitialize(align) :
	if (align == 1) :
		var person : Adventurers = get_child(0)
		pName = person.getName()
		st = person.getStrength()
		agil = person.getAgility()
		def = person.getDefence()
		intel = person.getIntelligence()
		maxHP = person.getHealth()
		maxMP = person.getMana()
		Fighters.setFighterStats(pName, maxHP, maxMP, st, agil, def, intel) 
		
	if (align == 0) :
		var person : Enemy = get_child(0)
		pName = person.getName()
		st = person.getStrength()
		agil = person.getAgility()
		def = person.getDefence()
		intel = person.getIntelligence()
		maxHP = person.getHealth()
		maxMP = person.getMana()
		Fighters.setFighterStats(pName, maxHP, maxMP, st, agil, def, intel)
	
	



# Sets the fighter on the specified side. Left if villain, right if hero
func appear() :
	
	pass

func isPartyMember(var member : bool) :
	if (member == true) : 
		align = 1
	if (member == false) :
		align = 0
	

func setFighterStats(var name : String, var pMAXHP : int, var pMAXMP : int, var pStr : int, var pAgil : int, var pDef : int, var pIntel : int) -> Array :
	var fighter = [name, pMAXHP, pMAXMP, pStr, pAgil, pDef, pIntel]
	return fighter


# Defines the actions the fighter can take. For now, focus on a basic attack action
func combat_action() :
	pass

