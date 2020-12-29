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


#This is the character sheets that all game pieces
#are intended to use. It's under development.
#it's put on a node called sheet under the game piece
#root.

var charname="blank"
var gender="male"

var _level=0

var _hp=10
var _mp=10
var _sp=10
var _maxhp=10
var _maxmp=10
var _maxsp=10

var _str=5
var _dex=5
var _end=5
var _int=5
var _wis=5
var _wil=5
var _luc=5

var _exp=0
var _nextlevel=100

var skillPoints=100

var meleePower=10
var minMeleePower=10

var meleeDefense=10
var minMeleeDefense=10

var giftPower=10
var giftDefense=10

var blockDefense=50
var resistDefense=50

var wepMin=1
var wepMax=1

var isdefend=false

#attackers
var lastMelee=null
var lastGift=null

#var rnd=null#RandomNumberGenerator.new()

#var mutex=null

func _ready():
	#rnd=get_node_or_null("../../randomNode")
	
#	mutex=Mutex.new()
	#temporary for testing
#	gender="female"
	calcDmg()
	calcDef()
	pass # Replace with function body.

#calculate raw damage power
func calcDmg():
	meleePower=_dex+_str
	minMeleePower=meleePower
#	meleePower=meleePower*wepMax
#	minMeleePower=meleePower*wepMin
	pass

#calculate raw defense power
func calcDef():
	meleeDefense=_dex+_end
	minMeleePower=_dex+_end
	pass

func addExp(expnum):
	_exp+=expnum
	#if(_exp>=_nextlevel):
	#	levelUp()
	pass

func getMelee():
	var dmg
	#dmg=rnd.getRangeI(minMeleePower,meleePower)
	dmg=meleePower
	return dmg
	pass

func meleeAttack(att,dmg):
	lastMelee=att
	var offset
#	offset=rnd.getRangeI(minMeleeDefense,meleeDefense)
	offset=meleeDefense
	if(isdefend):
		offset=offset+blockDefense
	dmg=dmg-offset
	if(dmg<=0):
		dmg=1
	offset=_hp-dmg
	if(offset<0):
		dmg=_hp
		_hp=0
	else:
		_hp=offset
		
	return dmg
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
