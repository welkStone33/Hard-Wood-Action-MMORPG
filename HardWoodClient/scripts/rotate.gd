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



export var rotateSpeed=10


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _process(delta):
	
	self.rotation_degrees.y+= rotateSpeed*delta
	
	pass
