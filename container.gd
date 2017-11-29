extends Container

var coins=0

func rand_coin():
	get_node("score").set_text(str(coins))
	var pos=get_node("coin").get_pos()
	pos.x=randi()%(1025-int(get_node("coin").get_item_rect().size.x))+1
	get_node("coin").set_pos(pos)

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
			get_tree().quit()
	var coin_x=get_node("coin").get_pos().x
	var coin_y=get_node("coin").get_pos().y
	var coin_w=get_node("coin").get_item_rect().size.x
	var coin_h=get_node("coin").get_item_rect().size.y
	coin_x-=coin_w/2
	coin_y-=coin_h/2
	if x+w>=coin_x&&x<=coin_x+coin_w&&y-h<=coin_y&&y>=coin_y-coin_h:
		coins+=1
		rand_coin()
		if coins%6==0:
			var enemies=get_tree().get_nodes_in_group("enemies").size()
			for i in range(enemies):
				get_tree().get_nodes_in_group("enemies")[i].speed()
	get_node("debug").set_text(str(OS.get_frames_per_second()))

func _ready():
	rand_coin()
	set_process(true)
	pass
