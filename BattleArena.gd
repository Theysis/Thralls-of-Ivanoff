extends Node2D

class_name BattleArena 

var active : bool = false
var party : Array = []
var monsterGroup : Array = []

# Sets up the BattleArena
func initialize() :
	pass


# Begins Battle
func start_Battle() :
	active = true
	

# Transitions into combat
func play_intro(): 
	pass

# sets up the combat arena based on the party
#func ready_field(formation : Formation, party_members : Array): 
func ready_field() :
	pass

func play_turn() :
	pass


func get_active_Fighter() -> Fighters :
	return TurnQueue.activeCharacter

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
