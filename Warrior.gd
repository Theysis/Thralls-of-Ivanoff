extends Adventurers

class_name DudeGuy

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var pSprite = preload("res://Sprites/DudeGuy.png") 

func _intitialize() :
	pName = "DudeGuy"
	st = 20
	agil = 20
	intel = 20
	def = 20
	maxHP = 100
	maxMP = 100
	currentHP = 100
	currentMP = 100
	

func appear() :
	
	pass



