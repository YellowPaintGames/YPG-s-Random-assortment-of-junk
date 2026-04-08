extends Control
#The chunk of text with bible quotes that scrolls horizontally
@onready var control: Control = self
@onready var label: Label = $Label
var timetoscroll=3
@onready var texto = $Label.text 
func _ready() -> void:
	control.clip_contents = true
	label.text_overrun_behavior = TextServer.OVERRUN_NO_TRIMMING
	var final_offset = -(label.get_combined_minimum_size().x - control.size.x)
	var tween = create_tween()
	tween.tween_property(label, "offset_left", final_offset, timetoscroll)
func _on_timer_timeout() -> void:
	timetoscroll+=3
	$Label.text+=" "+texto
	var final_offset = -(label.get_combined_minimum_size().x - control.size.x)
	var tween = create_tween()
	tween.tween_property(label, "offset_left", final_offset, timetoscroll)
