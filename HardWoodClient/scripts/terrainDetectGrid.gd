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


#To be worked on.


var areax=100
var areaz=100
var areay=30

var areaScale=Vector3(100,30,100)

var gridx=6
var gridz=6
#36 grid areas
var detectres=null

var detectArea=[null,null]

func spawnGrid():
	
	detectres=load("res://gamePieces/detectArea11.tscn")
	
	var gridstartx = -(areax*gridx)*0.5
	var gridstartz = -(areaz*gridz)*0.5
	var endx = (areax*gridx)*0.5
	var endz = (areaz*gridz)*0.5
	
	var gridscan=0
	var scanx=0
	var scanz=0
	var news
	while (scanz<endz):
		
		news=detectres.instance()
		self.add_child(news)
		news.transform.origin.x=scanx+gridstartx
		news.transform.origin.z=scanz+gridstartz
		news.transform.origin.y=0
		detectArea[gridscan]=news
		detectArea[gridscan].scale=areaScale
		
		gridscan+=1
		scanx+=areax*0.5
		if(scanx>=endx):
			scanz+=areaz*0.5
			scanx=0
		
	
	
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	detectArea.resize(gridx*gridz)
	spawnGrid()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
