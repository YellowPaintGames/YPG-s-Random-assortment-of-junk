extends Node2D
#The entire code of the train, it's a little messy, but the carriage sway is two tweens going back and forth constantly,
#and the wheels are always spinning in process,  the shat is NOT a child of the wheels, it simply follows a node
#Put at the edge of the desired wheels
func _process(delta: float) -> void:
	$Train/Trainwheel.rotation_degrees+=10
	$Train/Trainwheel2.rotation_degrees+=10
	$Train/TranShaft.global_position=$Train/Trainwheel/Node2D.global_position
	$Train/Trainwheel3.rotation_degrees+=10
	$Train/Trainwheel4.rotation_degrees+=10
	$Train/TranShaft2.global_position=$Train/Trainwheel3/Node2D.global_position
	$Train/Trainwheel5.rotation_degrees+=10
	$Train/Trainwheel6.rotation_degrees+=10
	$Train/TranShaft3.global_position=$Train/Trainwheel5/Node2D.global_position
func _ready() -> void:
	var t=create_tween().set_loops()
	t.tween_property($Train,"position:x",-10,2)
	t.tween_property($Train,"position:x",10,2)
