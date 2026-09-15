extends Sprite2D
@export_range(0.1,1) var bounceinterval=0.1
func _ready() -> void:
	var T=create_tween().set_loops().set_trans(Tween.TRANS_BOUNCE)
	var T2=create_tween().set_loops().set_trans(Tween.TRANS_BOUNCE)
	T.tween_property(self,"scale:y",2,bounceinterval)
	T2.tween_property(self,"scale:x",7,bounceinterval)
	T.tween_property(self,"scale:y",5,bounceinterval)
	T2.tween_property(self,"scale:x",5,bounceinterval)
