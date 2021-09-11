extends Node2D

var snowflake_scene = preload("res://scenes/snowflake.tscn")
var snowflakes = 0
const MAX_SNOWFLAKES = 100

var rng = RandomNumberGenerator.new()

var was_pressed = false

func _ready():
	randomize()
	rng.randomize()
	$Timer.emit_signal("timeout")
	
func _on_Timer_timeout():
	# Snowflake spammer
	if not snowflakes > MAX_SNOWFLAKES:
		var new_snowflake = snowflake_scene.instance()
		add_child(new_snowflake)
		snowflakes += 1
	
	# Shows "Click Me" if not pressed
	elif not was_pressed and has_node("click_me") and not $click_me.visible:
		$click_me/AnimationPlayer.play("reveal")

func hide_click_me():
	if was_pressed and has_node("click_me") and $click_me.visible:
		$click_me/AnimationPlayer.play_backwards("reveal")
		yield(get_tree().create_timer($click_me/AnimationPlayer.get_animation("reveal").length), "timeout")
		$click_me.queue_free()
