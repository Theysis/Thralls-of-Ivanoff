extends Node


class_name BattleArena 

var active : bool = false
var party : Array = []
var monsterGroup : Array = []

signal battle_ended(party)
signal Victory
signal Defeat

# Sets up the BattleArena
func initialize(monsterGroup : Array, party : Array) :
	play_intro()
	ready_field(monsterGroup, party)
	
	# Put Enemies into queue
	pass


# Begins Battle
func start_Battle() :
	active = true
	

# Transitions into combat
func play_intro():
	 
	pass

# sets up the combat arena based on the party

func ready_field(monster_buddies : Array, party_members : Array) :
	
	pass

func play_turn() :
	pass


func get_active_Fighter() -> Fighters :
	return TurnQueue.activeCharacter

func get_party() -> Array :
	return party

func get_targets() -> Array :
	if get_active_Fighter().party_member:
		return TurnQueue.get_monsters()
	else :
		return TurnQueue.get_Party()

# Called when battle ends and transitions back to 
func end_Battle():
	yield()
	active = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
