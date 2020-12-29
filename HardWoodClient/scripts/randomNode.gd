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


#This node is indeded for the server.
#It's a global access to random number generation
#using the game engine godot engine.
#It helps keep the random number generation out of
#prediction.


var rnd=RandomNumberGenerator.new()
var maxRoll=10
var curRoll=50

func _ready():
	pass # Replace with function body.

func reroll():
	if(curRoll<maxRoll):
		return
	curRoll=0
	var d=OS.get_time()
	var s=(d.hour*60*60)+(d.minute*60)+d.second
	rnd.seed=s
	rnd.randomize()
	pass

func getRangeI(low,high):
	reroll()
	curRoll+=1
	return rnd.randi_range(low,high)
	pass

func getRangeF(low,high):
	reroll()
	curRoll+=1
	return rnd.randf_range(low,high)
	pass

