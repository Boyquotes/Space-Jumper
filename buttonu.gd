extends TextureButton

func _process(delta):
	if self.is_pressed()&&get_node("/root/Container/player").get_pos().x+get_node("/root/Container/player").get_item_rect().size.x/2<=1020:
		get_node("/root/Container/player").pressed=true

func _ready():
	set_process(true)
	pass