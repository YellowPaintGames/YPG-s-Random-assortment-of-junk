extends Node2D
#The score screen main logic, all the values are stored initially and then they all have a doppleganger
#that ticks by 1 to show the value upping 1 by 1 on the screen
var accuracy=157
var healthbonus=632
var style=141
var total=accuracy+healthbonus+style
var acc=0
var HB=0
var Sty=0
var t=0
func _ready() -> void:
	$Node2D/Scared/Eyes.look_at($Panel/Accuracy/Label.global_position)
	while acc != accuracy:
		await (get_tree().create_timer(0.001).timeout)
		acc+=1
		$Ding.play()
		$Panel/Accuracy/Label.text=str(acc)
	$Explosion.play()
	$KABOOM.play()
	$Node2D/Scared/Eyes.look_at($Panel/Health_Bonus/Label.global_position)
	while HB != healthbonus:
		await (get_tree().create_timer(0.001).timeout)
		HB+=1
		$Ding.play()
		$Panel/Health_Bonus/Label.text=str(HB)
	$Explosion2.play()
	$KABOOM.play()
	$Node2D/Scared/Eyes.look_at($Panel/Style/Label.global_position)
	while Sty != style:
		await (get_tree().create_timer(0.001).timeout)
		Sty+=1
		$Ding.play()
		$Panel/Style/Label.text=str(Sty)
	$Explosion3.play()
	$KABOOM.play()
	$Node2D/Scared/Eyes.look_at($Panel/Total/Label.global_position)
	while t != total:
		$Ding.play()
		await (get_tree().create_timer(0.001).timeout)
		t+=1
		$Panel/Total/Label.text=str(t)
	$Explosion4.play()
	$KABOOM.play()
	$Node2D/GPUParticles2D.emitting=false
	$Node2D/Scared.hide()
	$Node2D/scream.show()
	$screech.play()
func _on_explosion_finished() -> void:
	$Explosion.hide()
func _on_explosion_2_finished() -> void:
	$Explosion2.hide()
func _on_explosion_3_finished() -> void:
	$Explosion3.hide()
func _on_explosion_4_finished() -> void:
	$Explosion4.hide()
func _on_screech_finished() -> void:
	$Node2D/scream.hide()
	$Explosion5.play()
	$KABOOM.play()
