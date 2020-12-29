extends Spatial

#This file is part of 'Hard Wood' an Action MMORPG.
#
#    'Hard Wood' is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    'Hard Wood' is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with 'Hard Wood'.  If not, see <https://www.gnu.org/licenses/>.


#This node will spawn sprites which run their own 
#script for placing themself on the terrain.


var spriteres=load("res://sprites/grassSprite1.tscn")
var xsize=20
var zsize=20
var num=20
var theseed=100
var spawnTime=0.2
var spawnTimer=0
var usescale=Vector3(3,3,3)


func _ready():
	pass # Replace with function body.

func spawn():
	var ran=RandomNumberGenerator.new()
	ran.set_seed(theseed)
	ran.randomize()
	var posz;
	var posx;
	var scan=0;
	var newsprite
	while (scan<num):
		posx=ran.randf_range(-xsize,xsize)
		posz=ran.randf_range(-zsize,zsize)
		newsprite=spriteres.instance()
		self.add_child(newsprite)
		newsprite.transform.origin=Vector3(posx,0,posz)
		newsprite.scale=usescale
		scan+=1
		
	var hidemarker=get_node("cube")
	if(hidemarker):
		hidemarker.free()
	
	#hidemarker=get_node("CollisionShape")
	#if(hidemarker):
	#	hidemarker.free()
	#hidemarker=get_node("gravityNode")
	#if(hidemarker):
		#hidemarker.free()
		
	self.set_script(null)
		
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	spawnTimer+=delta
	if(spawnTimer>=spawnTime):
#		print_debug("spawn")
		spawnTimer=0
		spawn()
		#self.set_script(null)
	pass
