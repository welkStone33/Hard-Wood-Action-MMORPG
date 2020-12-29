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


#Attached to a node under a kinematicbody.
#This script forces Kinematicbody down the y axis
#until it touches another object.

var disable=false
var rig=null
var gravitySpeed=400
var grounded=false



# Called when the node enters the scene tree for the first time.
func _ready():
	rig=get_node("..")

	pass # Replace with function body.

func _process(_delta):
	runGravity(_delta)
	pass

func runGravity(delta):
#	return
	if(grounded):
		return 0
		
	var _v : Vector3#=Vector3(0,-1,0)
	#v.y = -1
	_v.x = 0
	_v.z = 0
	_v.y= -gravitySpeed*delta
	

	#if(!rig.test_move(rig.global_transform,v,false)):
	#	rig.global_transform.origin+=v
	#else:
	rig.move_and_collide(_v,false)


	pass
