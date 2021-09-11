extends AnimatedSprite

func _ready():
	yield(get_tree().create_timer(2.0), "timeout")
	$AnimationPlayer.emit_signal("animation_finished", "move1")

func _on_AnimationPlayer_animation_finished(_anim_name):
	if not $AnimationPlayer.is_playing():
		$AnimationPlayer.play("move1")
		$AnimationPlayer.queue("move1")
		$AnimationPlayer.queue("move2")

func dizziness():
	$AnimationPlayer.stop(false)
	play("dizziness")
	$Timer.start()

func _on_Timer_timeout():
	$AnimationPlayer.play()
	play("default")
