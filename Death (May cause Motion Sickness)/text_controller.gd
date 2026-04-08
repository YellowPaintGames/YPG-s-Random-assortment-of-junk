extends Node
#The "YOU ARE DEAD" animation at the death screen, has 3 possible things it can say
func _ready() -> void:
	randomize()
	var possibletext=randi()%3
	if possibletext==0:
		$T1.text="ALL"
		$T2.text="YOUR"
		$T3.text="FAULT"
	elif possibletext==1:
		$T1.text="WHY"
		$T2.text="DID"
		$T3.text="YOU?"
	elif possibletext==2:
		$T1.text="THEIR"
		$T2.text="BLOODY"
		$T3.text="LIES"
func _on_timer_start_timeout() -> void:
	$T1.text="[shake rate=35.0 level=40 connected=3]  YOU"
	await (get_tree().create_timer(0.5).timeout)
	$T2.text=" [shake rate=35.0 level=40 connected=3] ARE"
	await (get_tree().create_timer(0.5).timeout)
	$T3.text=" [shake rate=35.0 level=40 connected=3] DEAD"
