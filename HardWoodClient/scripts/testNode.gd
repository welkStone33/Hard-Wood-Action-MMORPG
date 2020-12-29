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


#A node used for performance testing.

#var spawnUnit=load("res://chibi/maleChibi.tscn")
#var spawnUnit=load("res://chibi/femaleChibi1.tscn")
var spawnUnit=load("res://mobs/scorpion.tscn")

var spawnNumber=5
var firstrun=false
var rangex=50
var rangez=50
var aty=30

var track=[null,null]
var tracknum=0


var spawnTime=120
var spawnTimer=10



# Called when the node enters the scene tree for the first time.
func _ready():
	track.resize(spawnNumber)
	spawnTimer=spawnTime
	pass # Replace with function body.


func deletethem():
	var scan=0;
	while(scan<tracknum):
		if(track[scan]):
			track[scan].free()
		scan+=1
	tracknum=0
	pass

func spawnthem():
	deletethem()
	
	#spawnUnit=load("res://chibi/maleChibi.tscn")
	#spawnUnit=load("res://chibi/femaleChibi1.tscn")
	#spawnUnit=load("res://mobs/scorpion.tscn")
	var ran=get_node("../../randomNode")
	
	var scan=0
	var x
	var z
	var newunit
	while (scan<spawnNumber):
		
		newunit=spawnUnit.instance()
		get_node("..").add_child(newunit)
		newunit.transform.origin.y=aty
		x=ran.getRangeF(-rangex,rangex)
		z=ran.getRangeF(-rangez,rangez)
		newunit.transform.origin.x=x
		newunit.transform.origin.z=z
		track[tracknum]=newunit
		tracknum+=1
#		newunit.hide()
		#newunit.scale=Vector3(0.1,0.1,0.1)
		
		scan+=1
	#spread3()
	pass


func _process(delta):

#	return

	spawnTimer+=delta
	if(spawnTimer<spawnTime):
		return
		
	spawnTimer=0
	spawnthem()

	pass
