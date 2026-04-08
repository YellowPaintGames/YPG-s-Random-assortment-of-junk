extends Node2D
#These are the creatures in the zoo, they move by rotation on diferent parent pivots that alternate between one
#on the left and one in the right
@export var r := -1.0
var canspin=true
@onready var currPiv=$P1
@export var timetospin=1.0
func _ready() -> void:
	$Timer.wait_time=timetospin
func _process(delta: float) -> void:
	$Icon.global_position=currPiv.get_node("Body/Nub1").global_position
	$Icon2.global_position=currPiv.get_node("Body/Nub2").global_position
	if canspin:
		currPiv.rotation+=r*delta
func _on_timer_timeout() -> void:
	canspin=true
func _on_nub_1_body_entered(body: Node2D) -> void:
	if body not in get_children() and canspin:
		await get_tree().process_frame
		canspin=false
		$P2.global_position=currPiv.get_node("Body/Nub1").global_position
		currPiv.get_node("Body").reparent($P2,true)
		currPiv=$P2
		$Timer.start()
func _on_nub_2_body_entered(body: Node2D) -> void:
	if body not in get_children() and canspin:
		await get_tree().process_frame
		canspin=false
		$P1.global_position=currPiv.get_node("Body/Nub2").global_position
		currPiv.get_node("Body").reparent($P1,true)
		currPiv=$P1
		$Timer.start()
