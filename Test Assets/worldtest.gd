extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var screen_width = get_viewport().size.x
	var screen_height = get_viewport().size.y
	$playertest/transition.rect_size = Vector2(screen_width,screen_height) 
	$playertest.can_move = false
	$playertest/transition.show()
	$playertest/Tween.interpolate_property($playertest/transition,"rect_position",
	Vector2($playertest/transition.rect_position.x,$playertest/transition.rect_position.y),
	Vector2(-$playertest/transition.rect_position.x,$playertest/transition.rect_position.y),1.5,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT)
	$playertest/Tween.start()
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Tween_tween_completed(object, key):
	$playertest.can_move = true
	$playertest/transition.hide()
