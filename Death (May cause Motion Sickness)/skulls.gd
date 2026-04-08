extends Node
#The skull on the death menu, does the "jitter" doing a for loop in a random range of 7 values (0 to 6) 
#and chooses a frame at random
func _ready() -> void:
	randomize()
	$Timer.wait_time=randi()%3
	$Timer.start()
func _on_timer_timeout() -> void:
	$Skull1.hide()
	$AnimatedSprite2D.show()
	for n in range(randi()%7):
		await (get_tree().create_timer(0.05).timeout)
		$AnimatedSprite2D.frame=randi()%3
	$AnimatedSprite2D.hide()
	$Skull1.show()
	$Timer.wait_time=randi()%3
	$Timer.start()
