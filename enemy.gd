extends Sprite
var speed=6;

func speed():
	speed+=1

func _process(delta):
	var pos=self.get_pos()
	if pos.x-self.get_item_rect().size.x/2<=1024-speed:
		pos.x+=speed
	else:
		pos.x=-self.get_item_rect().size.x/2
	self.set_pos(pos)

func _ready():
	add_to_group("enemies")
	set_process(true)
	pass