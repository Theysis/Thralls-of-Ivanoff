
extends Node


class_name BattleArena 

var active : bool = false
var party : Array
var monsterGroup : Array

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
	yield(play_intro(), "completed")
	active = true
	play_turn()

# Transitions into combat
func play_intro():
	for person in TurnQueue.get_party() :
		person.appear()
	yield (get_tree().create_timer(0.5), "timeout")
	for person in TurnQueue.get_monsters() :
		person.appear()
	yield(get_tree().create_timer(0.5), "timeout")

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
	emit_signal("battle_ends")
	active = false
	var player_won = true # Fix this
	if player_won:
		emit_signal("Victory")
	else:
		emit_signal("Defeat")
