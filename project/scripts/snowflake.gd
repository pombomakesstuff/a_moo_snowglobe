extends Sprite

const SNOWFLAKE_INITIAL_POS_X_MIN = -252
const SNOWFLAKE_INITIAL_POS_X_MAX = 218
const SNOWFLAKE_INITIAL_POS_Y = -260
const SNOWFLAKE_INITIAL_SIDE_POS_Y = -208
const SNOWFLAKE_FINAL_POS_Y = 210
const SNOWFLAKE_FINAL_SIDE_POS_Y = 122
const SNOWGLOBE_LEFT_SIDE = -150
const SNOWGLOBE_RIGHT_SIDE = 148
const FALL_SPEED = 2

func _ready():
	position = Vector2(get_parent().rng.randi_range(SNOWFLAKE_INITIAL_POS_X_MIN, SNOWFLAKE_INITIAL_POS_X_MAX), SNOWFLAKE_INITIAL_POS_Y)
	if position.x < SNOWGLOBE_LEFT_SIDE or position.x > SNOWGLOBE_RIGHT_SIDE:
		position.y = SNOWFLAKE_INITIAL_SIDE_POS_Y
	var scale_modifier = float(randi() % 4)/100.0 # Random percentage between 0% (0) and 3% (0.03)
	scale += Vector2(scale_modifier, scale_modifier)

func _process(_delta):
	position.x += randi() % 3 - 1 # Adds random number between -1 and 1 to the X position
	position.y += FALL_SPEED
	
	if (position.x < SNOWGLOBE_LEFT_SIDE or position.x > SNOWGLOBE_RIGHT_SIDE) and position.y > SNOWFLAKE_FINAL_SIDE_POS_Y:
		queue_free()
	
	if position.y > SNOWFLAKE_FINAL_POS_Y:
		queue_free()
