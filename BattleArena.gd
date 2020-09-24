extends Node2D

class_name BattleArena 

var active : bool = false
var party : Array = []

# Begins Battle
func start_Battle():
	active = true
	
func play_intro(): 
	pass
	
# sets up the combat arena based on the party
#func ready_field(formation : Formation, party_members : Array): 
#	pass

# Called when battle ends and transitions back to 
func end_Battle():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
