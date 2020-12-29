extends ItemList





func _ready():
	var scan=0
	while (scan<50):
		self.add_item("testing the list box")
		scan+=1
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
