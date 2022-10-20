extends CanvasLayer

# The screen that guides the Player thorough a given adventure
# has an interface through which pages, backgrounds and such can be changed
# 

func _ready():
	load_portrait(load("res://Resources/00164-3137164651-matte painting of texture, realistic Watercolor Illustration, lineart, artwork by Jozef Chelmonski and John Martin, highly detai.png"))

func load_page(text):
	$"%TextBody".text = text
	pass

func load_back(tex : Texture):
	$"%BackImage".texture = tex
	pass

func load_portrait(tex : Texture):
	$HBoxContainer/Portrait/Animator.play("Fade")
	yield($HBoxContainer/Portrait/Animator,"animation_finished")
	$"%Portrait".texture = tex
	$HBoxContainer/Portrait/Animator.play_backwards("Fade")
	pass
