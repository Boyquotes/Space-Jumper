extends Container

func _process(delta):
	var x=get_node("player").get_pos().x
	var y=get_node("player").get_pos().y
	var w=get_node("player").get_item_rect().size.x
	var h=get_node("player").get_item_rect().size.y
	x-=w/2
	y-=h/2
	var enemies=get_tree().get_nodes_in_group("enemies").size()
	for i in range(enemies):
		var enemy_x=get_tree().get_nodes_in_group("enemies")[i].get_pos().x
		var enemy_y=get_tree().get_nodes_in_group("enemies")[i].get_pos().y
		var enemy_w=get_tree().get_nodes_in_group("enemies")[i].get_item_rect().size.x
		var enemy_h=get_tree().get_nodes_in_group("enemies")[i].get_item_rect().size.y
		enemy_x-=enemy_w/2
		enemy_y-=enemy_h/2
		if x>=enemy_x&&x<=enemy_x+enemy_w&&y<=enemy_y&&y>=enemy_y-enemy_h:
			print("YOU LOSE")
			get_tree().quit()

func _ready():
	set_process(true)
	pass
