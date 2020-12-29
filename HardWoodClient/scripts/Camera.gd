extends Camera

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


var target=null
var looktarget=null


#The camera follows a certain player piece around.
#The main player. The camera was designed to depend
#on that specific objects nodes.

# Called when the node enters the scene tree for the first time.
func _ready():
#	var g=get_node("../level0/maleChibi")
#	mountTarget(g)
	
	pass # Replace with function body.


func mountTarget(targ):
	if(!targ):
		return
	looktarget=targ.get_node("camLook")
	target=looktarget.get_node("camMount")
		

	pass

func updateLook():
	if(!target):
		return
	if(!looktarget):
		return
	self.global_transform.origin=target.global_transform.origin
	self.look_at(looktarget.global_transform.origin,Vector3(0,1,0))
	pass
	
func _process(_delta):
	updateLook()
	pass
	
