extends Sprite

func _process(delta):
	var pos=self.get_pos()
	if pos.x-self.get_item_rect().size.x/2<=1020:
		pos.x+=4
	else:
		pos.x=-self.get_item_rect().size.x/2
	self.set_pos(pos)

func _ready():
	add_to_group("enemies")
	set_process(true)
	pass