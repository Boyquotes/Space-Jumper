extends AnimatedSprite

var x=128
var i=0
var pressed=false

func jump():
	var pos=self.get_pos()
	if x>=1&&i<8:
		pos.y-=x
		if x!=1:
			x/=2
		self.set_pos(pos)
	if x<=128&&i>=8:
		pos.y+=x
		if x!=128:
			x*=2
		self.set_pos(pos)
	i+=1
	if i==16:
		i=0
		pressed=false

func _process(delta):
	var pos=self.get_pos()
	if Input.is_action_pressed("ui_right")&&pos.x+self.get_item_rect().size.x/2<=1022:
		pos.x+=2
	if Input.is_action_pressed("ui_left")&&pos.x-self.get_item_rect().size.x/2>=2:
		pos.x-=2
	self.set_pos(pos)
	if Input.is_action_pressed("ui_up"):
		pressed=true
	if pressed==true:
		jump()

func _ready():
	set_process(true)
	pass