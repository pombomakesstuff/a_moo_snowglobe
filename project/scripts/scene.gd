extends Node2D

onready var snowglobe = get_node("pivot/snowglobe")
onready var snowglobe_button = get_node("pivot/snowglobe/TextureButton")
onready var cow = get_node("pivot/snowglobe/cow")

func _ready():
	snowglobe_button.connect("pressed", self, "shake_snowglobe")

func shake_snowglobe():
	if not $AnimationPlayer.is_playing():
		$AnimationPlayer.play("shake_snowglobe")
		snowglobe.was_pressed = true
		snowglobe.hide_click_me()

func _on_AnimationPlayer_animation_finished(_anim_name):
	snowglobe.snowflakes = 0
	cow.dizziness()
