extends VBoxContainer

class_name Cardboard

var mouse_offset = Vector2.ZERO #offset between mouse and this scene when mouse dragging happens

func _ready():
	set_physics_process(false)
	$Border.points[1] = Vector2(0,rect_size.y)
	$Border.points[2] = rect_size
	$Border.points[3] = Vector2(rect_size.x,0)
	$Divide.position.y = $Image.rect_size.y
	$Divide.points[1] = Vector2(rect_size.x,0)
	

func _gui_input(event):
	if event.is_action_pressed("mouse_click"):
		grab()
	if event.is_action_released("mouse_click"):
		drop()

func _physics_process(delta):
	var desired_loc = get_global_mouse_position() - mouse_offset
	rect_global_position = rect_global_position.move_toward(desired_loc,0.12*rect_global_position.distance_squared_to(desired_loc)*delta)
	#check if nodes below can take object data
	pass

func grab():
	get_parent().move_child(self,get_parent().get_child_count())
	mouse_offset = get_global_mouse_position() - rect_global_position
	set_physics_process(true)


func drop():
	set_physics_process(false)

func can_accept_drop(drop_data):
	# check drop_data and return true is can accept
	return false

func accept_drop(drop_data):
	assert( can_accept_drop(drop_data) )
	pass


