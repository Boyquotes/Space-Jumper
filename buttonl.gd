extends TextureButton

func _process(delta):
	if self.is_pressed()&&get_node("/root/Container/player").get_pos().x+get_node("/root/Container/player").get_item_rect().size.x/2>=4:
		get_node("/root/Container/player").set_pos(Vector2(get_node("/root/Container/player").get_pos().x-4,get_node("/root/Container/player").get_pos().y))

func _ready():
	set_process(true)
	pass
