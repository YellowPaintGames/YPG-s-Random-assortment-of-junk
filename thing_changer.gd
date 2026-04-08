extends Node
#This is more of a BTS thing and not part of the showcase, you can use the arrow keys to 
#change what's being displayed right now, just a little QOL if you want to look at them,
#without quitting/loading all of them
var currentThing=0
var things=["res://Death (May cause Motion Sickness)/Death.tscn","res://NotAMenuButStillCool/Gears.tscn","res://PaperPleasethingy/PaperPleaseThingy.tscn","res://ScoreResults/ScoreResults.tscn","res://Train/train.tscn","res://Weird Creature Prototype/Zoo.tscn"]
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_right"):
		currentThing+=1
		if currentThing>things.size()-1:
			currentThing=0
		get_tree().change_scene_to_file(things[currentThing])
	if Input.is_action_just_pressed("ui_left"):
		currentThing-=1
		if currentThing<0:
			currentThing=things.size()-1
		get_tree().change_scene_to_file(things[currentThing])
	
