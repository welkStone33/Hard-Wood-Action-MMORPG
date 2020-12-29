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


#This script places one grass sprite
#in the scene tree after a certain time is passed.
#it's used together with gravity.


var outTimer=0
var outTime=1
var landed=false


func _ready():
	pass # Replace with function body.


func _process(delta):
	if(landed):
		return
	outTimer+=delta
	if(outTimer<outTime):
		return
	landed=true
	var n=get_node("KinematicBody")
	var s=get_node("KinematicBody/Sprite3D")
	n.remove_child(s)
	self.add_child(s)
	s.transform.origin.y=n.transform.origin.y
	n.free()
	self.set_script(null)
	
	pass
