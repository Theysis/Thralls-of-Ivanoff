extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
class_name TurnQueue

var activeCharacter

func initialize():
	activeCharacter = get_child(0)
	
func current_turn(): 
	yield(activeCharacter.current_turn(), "completed")
	var new_index : int = (activeCharacter.get_index() + 1) % get_child_count() 
	activeCharacter = get_child(new_index)
	
func player_turn(target : Fighters, action : combat_action):
	pass
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
