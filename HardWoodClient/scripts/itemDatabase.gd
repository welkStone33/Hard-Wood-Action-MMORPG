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


#This script is referenced by all the game pieces
#for information on items.
#It's sits under the root in a node called,
#itemDatabase

var number=9
var thename=["1","2"]
var mountNameMale=["1","2"]
var mountNameFemale=[1,1]
var worldName=["1","2"]
var hideHair=[false,false]
var gender=["male","male"]
var useBody=["body1","body1"]
var race=["human","human"]
var description=["1","1"]

var type=["1","2"]
var minDmg=[1,2]
var maxDmg=[1,2]
var maxDur=[1,2]
var useDur=[1,2]
var maxStack=[1,1]
var opt1=[1,1]
var opt2=[1,1]
var opt3=[1,1]

# Called when the node enters the scene tree for the first time.
func _ready():
	resizeList(number)
	populateDatabase()
	
	pass # Replace with function body.

func populateDatabase():
	thename[0]="Basic Axe"
	mountNameMale[0]="axe0"
	mountNameFemale[0]="axe0"
	worldName[0]="res://itemWorld/basicAxe.tscn"
	type[0]="axe"
	useBody[0]="body"
	hideHair[0]=false
	race[0]="human"
	gender[0]="any"
	maxDur[0]=1000
	useDur[0]=20
	minDmg[0]=1.25
	maxDmg[0]=1.4
	opt1[0]=0
	opt2[0]=0
	opt3[0]=0
	description[0]="Basic Axe: Standard issue given by the realm under poverty conditions."
	
	thename[1]="Female Sackcloth"
	mountNameFemale[1]="femaleSackCloth"
	mountNameMale[1]=""
	worldName[1]=""
	type[1]="cloth"
	useBody[1]="body1"
	hideHair[1]=false
	race[1]="human"
	gender[1]="female"
	maxDur[1]=10000
	useDur[1]=0
	minDmg[1]=1
	maxDmg[1]=4
	maxStack[1]=1
	opt1[1]=0
	opt2[1]=0
	opt3[1]=0
	description[1]="Sackcloth: Cloth crafted from cheap sack cloth material."
	
	thename[2]="Male Sackcloth"
	mountNameMale[2]="maleSackcloth"
	mountNameFemale[2]=""
	worldName[2]=""
	type[2]="cloth"
	useBody[2]="body1"
	hideHair[2]=false
	race[2]="human"
	gender[2]="male"
	maxDur[2]=10000
	useDur[2]=0
	minDmg[2]=1
	maxDmg[2]=4
	maxStack[2]=1
	opt1[2]=0
	opt2[2]=0
	opt3[2]=0
	description[2]="Sackcloth: Cloth crafted from cheap sack cloth material."
	
	thename[3]="Blue Pink Dress"
	mountNameFemale[3]="dress0"
	mountNameMale[3]=""
	worldName[3]=""
	type[3]="cloth"
	useBody[3]="body2"
	hideHair[3]=false
	race[3]="human"
	gender[3]="female"
	maxDur[3]=1000
	useDur[3]=10
	minDmg[3]=1
	maxDmg[3]=4
	maxStack[3]=1
	opt1[3]=0
	opt2[3]=0
	opt3[3]=0
	description[3]="Blue Pink Dress: A dress with blue and pink coloring. It has a decorated center"
	
	thename[4]="Blunder Buss"
	mountNameMale[4]="BlunderBuss0"
	mountNameFemale[4]="BlunderBuss0"
	worldName[4]=""
	type[4]="gun"
	useBody[4]="body1"
	hideHair[4]=false
	race[4]="human"
	gender[4]="any"
	maxDur[4]=10000
	useDur[4]=1
	minDmg[4]=0.5 #dmg range
	maxDmg[4]=10000 #damage power
	maxStack[4]=1
	opt1[4]=0#loaded or not
	opt2[4]=8#number shot used per load
	opt3[4]=0
	description[4]="Blunder Buss: A basic gun"
	
	thename[5]="Gun Shot"
	mountNameMale[5]=""
	mountNameFemale[5]=""
	worldName[5]=""
	type[5]="item"
	useBody[5]=""
	hideHair[5]=false
	race[5]="any"
	gender[5]="any"
	maxDur[5]=1
	useDur[5]=1
	minDmg[5]=5 #speed
	maxDmg[5]=1000 #damage power
	maxStack[5]=43
	opt1[5]=0
	opt2[5]=0
	opt3[5]=0
	description[5]="Shot: It's ammo for a gun. Both powder and pellets"
	
	
	thename[6]="Basic Bow"
	mountNameMale[6]="basicBow0"
	mountNameFemale[6]="basicBow0"
	worldName[6]=""
	type[6]="bow"
	useBody[6]=""
	hideHair[6]=false
	race[6]="any"
	gender[6]="any"
	maxDur[6]=1000
	useDur[6]=25
	minDmg[6]=40 #initial speed
	maxDmg[6]=15 #multiplier agisnt dex
	maxStack[6]=1
	opt1[6]=0 #loaded or not
	opt2[6]=0
	opt3[6]=0
	description[6]="Basic Bow: Aim and shoot an arrow."
	
	
	thename[7]="Basic Arrow"
	mountNameMale[7]="BasicArrow0"
	mountNameFemale[7]="basicArrow0"
	worldName[7]=""
	type[7]="arrow"
	useBody[7]=""
	hideHair[7]=false
	race[7]="any"
	gender[7]="any"
	maxDur[7]=100
	useDur[7]=100
	minDmg[7]=5 #range
	maxDmg[7]=1000 #damage power
	maxStack[7]=100
	opt1[7]=0
	opt2[7]=0
	opt3[7]=0
	description[7]="Arrow: It's used for a bow"

	thename[8]="Basic Staff"
	mountNameMale[8]="basicStaff0"
	mountNameFemale[8]="basicStaff0"
	worldName[8]=""
	type[8]="staff"
	useBody[8]=""
	hideHair[8]=false
	race[8]="any"
	gender[8]="any"
	maxDur[8]=1000
	useDur[8]=13
	minDmg[8]=1.15
	maxDmg[8]=1.2
	maxStack[8]=100
	opt1[8]=0
	opt2[8]=0
	opt3[8]=0
	description[8]="A basic Staff: Allowing one to use gifts."


	
	pass

func getDescription(ind):
	return description[ind]
	
	pass

func findItemIndex(aname):
	var scan=0
#	print_debug(aname)
	while(scan<number):
		if(thename[scan]==aname):
			return scan
		scan+=1
	return -1
	pass

func resizeList(num):
	number=num
	thename.resize(num)
	mountNameFemale.resize(num)
	mountNameMale.resize(num)
	worldName.resize(num)
	hideHair.resize(num)
	useBody.resize(num)
	race.resize(num)
	type.resize(num)
	gender.resize(num)
	minDmg.resize(num)
	maxDmg.resize(num)
	maxDur.resize(num)
	useDur.resize(num)
	maxStack.resize(num)
	opt1.resize(num)
	opt2.resize(num)
	opt3.resize(num)
	description.resize(num)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
