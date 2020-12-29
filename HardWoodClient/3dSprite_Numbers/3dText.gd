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


#This node uses textures
#and creates 3d sprites that scroll
#up on the Y axis.

var curCam=null

var stringList=["none","none"]
var stringMax=64
var stringNumber=0
var usetime=5
var stringTimer=[0,0]
var stringTime=[0,0]

var sprite3d=["1","2"]
var spriteSpeed=[3,3]

var usecolor=Color(1.0,1.0,1.0,0.7)
var usescale=Vector3(0.7,0.7,0.7)
var usespeed=3
#var usespace=0.64#64x64 font size
var usespace=0.45
var xsize=64
var ysize=64

var firstrun=true


func _ready():
	stringList.resize(stringMax)
	sprite3d.resize(stringMax)
	spriteSpeed.resize(stringMax)
	stringTimer.resize(stringMax)
	stringTime.resize(stringMax)

	pass # Replace with function body.

func checkExplanation(_str):
	if(_str=="."):
		return "e1"
	if(_str==","):
		return "e4"
	if(_str=="!"):
		return "e2"
	if(_str=="?"):
		return "e3"
	return _str
	
	pass

func addStringCenter(_str,vect3,col:Color=usecolor,thespeed=usespeed,thetime=usetime,thescale=usescale,thespace=usespace):
	
	#create string as sprite
	var loc=addString(_str,vect3,col,thespeed,thetime,thescale,thespace)
	if(loc<0):
		return

	#create spatial at position
	var newspr=Spatial.new()

	var cam=get_viewport()
	if(cam):
		cam=cam.get_camera()
	
	get_node("..").add_child(newspr)
	#newspr.transform.origin=Vector3(0,0,0)
	newspr.global_transform.origin=vect3
	#newspr.transform.origin=vect3
	
	
	if(cam):
		newspr.rotation_degrees.y=cam.rotation_degrees.y
	
	#find position
	var index= -((_str.length()*0.5)*thespace)
	index=index+((xsize*0.01)*0.5)#adjust for sprite size
	#index*=0.5
	#print_debug(index)
	#index= -0.5
	
	#reassign sprites
	get_node("..").remove_child(sprite3d[loc])
	sprite3d[loc].scale=Vector3(1,1,1)
	newspr.add_child(sprite3d[loc])
	sprite3d[loc].transform.origin=Vector3(index,0,0)
	sprite3d[loc].rotation_degrees.y=0
	#if(cam):
	#	sprite3d[loc].rotation_degrees.y=cam.rotation_degrees.y+180
	sprite3d[loc]=newspr
	sprite3d[loc].scale=thescale
	#print_debug(sprite3d[loc].global_transform.origin)
	#print_debug(sprite3d[loc].transform.origin)
	return loc
	pass

func addString(_str,vect3,col:Color=usecolor,thespeed=usespeed,thetime=usetime,thescale=usescale,thespace=usespace):
	if(stringNumber>=stringMax):
		return -1
	curCam=get_viewport()
	if(curCam):
		curCam=curCam.get_camera()
		
	stringList[stringNumber]=_str
	var scan=1;
	var index=0
	
	var na="res://3dSprite_Numbers/texture_%s.png"
	var tna=""
	var a3d=null
	
	var ts=stringList[stringNumber]
	#This was done to extract just single characters
	ts.erase(1,stringList[stringNumber].length()-1)
	ts=checkExplanation(ts)
		
	tna=na % ts
	var sres=load(tna)
	
	sprite3d[stringNumber]=Sprite3D.new()
	sprite3d[stringNumber].modulate=col
	
	get_node("..").add_child(sprite3d[stringNumber])
	sprite3d[stringNumber].transform.origin=vect3
	
	if(sres):
		sprite3d[stringNumber].set_texture(sres)
	
	while (scan<stringList[stringNumber].length()):
		ts=stringList[stringNumber]
		
		#extracting single characters
		ts.erase(0,scan)
		ts.erase(1,ts.length()-1)
		ts=checkExplanation(ts)
		tna=na % ts
		
		#if(tna==" "):
		#	index=index+1
#		else:
		index=index+thespace
		sres=load(tna)
		if(sres):
			a3d=Sprite3D.new()
			sprite3d[stringNumber].add_child(a3d)
			a3d.modulate=col
			a3d.set_texture(sres)
			a3d.transform.origin=Vector3(0,0,0)
			a3d.transform.origin.x=index
		
			#a3d.pixel_size=0.03
		
		scan=scan+1
			

	sprite3d[stringNumber].global_transform.origin=vect3
	#sprite3d[stringNumber].global_transform.origin.y+=2
	if(curCam):
		sprite3d[stringNumber].rotation_degrees.y=curCam.rotation_degrees.y
	sprite3d[stringNumber].scale=thescale
	spriteSpeed[stringNumber]=thespeed
	stringTime[stringNumber]=thetime
	stringTimer[stringNumber]=0
	stringNumber=stringNumber+1

	#sprite3d[stringNumber].scale=usescale
	return stringNumber-1
	pass

func runStringTime(delta):
	var scan=0
	curCam=get_viewport().get_camera()
	while (scan<stringNumber):
		if(curCam):
			sprite3d[scan].rotation_degrees.y=curCam.rotation_degrees.y
		sprite3d[scan].global_transform.origin.y+=delta*spriteSpeed[scan]
		stringTimer[scan]=stringTimer[scan]+delta
		if(stringTimer[scan]>=stringTime[scan]):
			eraseString(scan)
			scan=scan-1
			
		scan=scan+1
	pass

func eraseString(i):
	stringList[i]=stringList[stringNumber-1]
	sprite3d[i].free()
	sprite3d[i]=sprite3d[stringNumber-1]
	stringTimer[i]=stringTimer[stringNumber-1]
	stringTime[i]=stringTime[stringNumber-1]
	stringNumber=stringNumber-1
	pass

func _process(delta):
	runStringTime(delta)
	
	#if(firstrun):
		#firstrun=false
		#addStringCenter("Testing Rotation",Vector3(0,0,0),Color(0,1,0),0.3,30)
	pass







