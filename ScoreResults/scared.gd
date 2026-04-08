extends Sprite2D
#The shake effect on the score screen
@export var shake = 5
func _ready():
	var shake_duration = 0.01
	var shake_count = 5
	var tween=create_tween().set_loops()
	for i in shake_count:
		tween.tween_property(self, "position",Vector2(randf_range(-shake,shake), randf_range(-shake, shake)), shake_duration)
