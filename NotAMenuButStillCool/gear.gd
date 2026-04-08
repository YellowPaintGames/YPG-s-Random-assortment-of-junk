extends Sprite2D
#Some gears that I made, they have two modes, one is smooth made in _process, and the other is through tweens 
#and timers, makes a "pulse", if that makes sense, to see one or the other, simply remove the "" on the parts 
#you want to see
@export var spin = 5
"""
func _process(delta: float) -> void:
	rotation_degrees+=spin
"""
"""
func _on_timer_timeout() -> void:
	var t=create_tween()
	t.set_trans(Tween.TRANS_BOUNCE)
	t.tween_property(self,"rotation_degrees",rotation_degrees+spin*10,0.2)
"""
