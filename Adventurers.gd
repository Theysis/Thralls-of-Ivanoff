extends Fighters

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
class_name Adventurers

var pName : String = ""
var st : int = 0 # Strength Stat
var agil : int = 0  # Agility
var def : int = 0 # Defence
var intel : int = 0 # Intelligence
var maxHP : int = 0 # Health
var maxMP : int = 0 # Magic Points / Ability Points
var currentHP : int = 0
var currentMP : int = 0

func _initialize():
	var isPartyMember : bool = true
	var person : Adventurers = .get_child(0)
	pName = person.getName()
	st = person.getStrength()
	agil = person.getAgility()
	def = person.getDefence()
	intel = person.getIntelligence()
	maxHP = person.getMaxHealth()
	currentHP = person.getCurrentHeath()
	maxMP = person.getMaxMana()
	currentMP = person.getCurrentMana()
	.setFighterStats(pName, maxHP, maxMP, st, agil, def, intel)
	


func getName() -> String : 
	return pName

func setName(newName : String) :
	pName = newName

func getMaxHealth() -> int :
	return maxHP

func getCurrentHeath() :
	return currentHP

func setHeath(hp : int) :
	currentHP = hp

func getMaxMana() -> int :
	return maxMP

func getCurrentMana() -> int :
	return currentMP

func setMana(MP : int) :
	currentMP = MP

func getStrength() -> int :
	return st

func setStrength(new_Str : int) :
	st = new_Str

func getAgility() -> int :
	return agil

func setAgility(new_agil : int) :
	agil = new_agil

func getDefence() -> int :
	return def

func setDefence(new_def : int) :
	def = new_def

func getIntelligence() -> int :
	return intel

func setIntelligence(new_intel : int) :
	intel = new_intel

func PlayerAttack():
	 pass

