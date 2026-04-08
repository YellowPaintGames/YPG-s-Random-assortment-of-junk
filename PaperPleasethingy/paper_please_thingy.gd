extends Node2D
#Papers Please style thing that does a while loop on ready, the bounce is through tweens
func _ready() -> void:
	var times=0
	while $Image.position.y>=position.y:
		times+=1
		await (get_tree().create_timer(0.5).timeout)
		var t=create_tween().set_trans(Tween.TRANS_BOUNCE)
		var p=$Image.position.y-times
		if p<=position.y:
			p=0
		t.tween_property($Image,"position:y",p,0.5)
