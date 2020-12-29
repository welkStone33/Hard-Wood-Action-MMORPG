extends ItemList


#This scource is part of the HUD. It's part of the
#inventory system for the client.


var player=null
var selectedIndex= -1
var changed=false

# Called when the node enters the scene tree for the first time.
func _ready():
	
	registerSignal()
	pass # Replace with function body.

func registerSignal():
	var _test=self.connect("item_activated", self, "activateItem")
	_test=self.connect("item_selected",self,"selectItem")
	_test=self.connect("nothing_selected",self,"selectNothing")
	pass

func selectNothing():
	selectedIndex= -1
	changed=true
	pass
	
func selectItem(index):
	selectedIndex=index
	changed=true
	pass

func activateItem(index):
	if(player):
		player.activateItem(index)
		var pm=get_node("../../connectionNode")
		pm.get_node("playerMove").rpc_id(0,"activatePlayerItem",pm.selfID,index)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
