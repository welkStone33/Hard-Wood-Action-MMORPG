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


#This script is indeded to give a way of producing
#inventories into the game. It gets put under
#the game piece main node on ti's on node called
#inventoryNode

#Maximum possible might get pruned later.

var numberItem=0
var maxItem=20
var maxPossible=50

var thename=["1","2"]
var type=["1","2"]
var minDmg=[1,2]
var maxDmg=[1,2]
var dur=[1,2]
var opt1=[1,2]
var opt2=[1,2]
var opt3=[1,2]
var stack=[1,1]
var dataIndex=[1,2]
var equiped=[false,false]

var rthename="empty"
var rtype="none"
var rminDmg=1
var rmaxDmg=2
var rdur=1000
var ropt1=0
var ropt2=0
var ropt3=0
var rstack=0
var rdataIndex=0
var rinvindex=0

var lthename="empty"
var ltype="none"
var lminDmg=1
var lmaxDmg=2
var ldur=1000
var lopt1=0
var lopt2=0
var lopt3=0
var lstack=0
var ldataIndex=0
var linvindex=0


var bthename="empty"
var btype="none"
var bminDmg=1
var bmaxDmg=2
var bdur=1000
var bopt1=0
var bopt2=0
var bopt3=0
var bdataIndex=1
var binvindex=0

var changed=false
var init=false

# Called when the node enters the scene tree for the first time.
func _ready():
#	print_debug("inv init")
	if(!init):
		resizeList(maxPossible)
	init=true
	
	#temporary
#	addItem("Basic Axe","axe",5,15,1000,0,0,0,0)
#	addItem("Blunder Buss","gun",10,1000,1000,0,0,0,4)
#	addItemByName("Basic Axe",1)
#	addItemByName("Blunder Buss",1)
#	addItemByName("Gun Shot",43)
#	addItemByName("Blue Pink Dress",1)
#	addItemByName("Basic Bow",1)
#	addItemByName("Basic Arrow",70)
#	addItemByName("Basic Staff",1)
	#print_debug("init inventoryNode")
	
	#bthename="Female Sackcloth"
	#btype="cloth"
	#bminDmg=1
	#bmaxDmg=4
	#bdur=10000
	#bdataIndex=1
	
	pass # Replace with function body.

func resizeList(num):
	thename.resize(num)
	type.resize(num)
	minDmg.resize(num)
	maxDmg.resize(num)
	dur.resize(num)
	opt1.resize(num)
	opt2.resize(num)
	opt3.resize(num)
	stack.resize(num)
	dataIndex.resize(num)
	equiped.resize(num)
	
	maxPossible=num
	
	pass

func findItemByName(_name,num):
	var scan=0
	var scan2=0
	while (scan<numberItem):
		if(thename[scan]==_name):
			scan2+=1
		if(scan2>=num):
			return scan
		scan+=1
	return -1
	pass

func removeItem(index):
	
	if(numberItem<=1):
		numberItem=0
		return
	
	if(index==numberItem-1):
		numberItem-=1
		return
	
	if(equiped[index]):
		return
	
	var scan=index
	while (scan<numberItem):
		thename[scan]=thename[scan+1]
		type[scan]=type[scan+1]
		minDmg[scan]=minDmg[scan+1]
		maxDmg[scan]=maxDmg[scan+1]
		dur[scan]=dur[scan+1]
		opt1[scan]=opt1[scan+1]
		opt2[scan]=opt2[scan+1]
		opt3[scan]=opt3[scan+1]
		stack[scan]=stack[scan+1]
		dataIndex[scan]=dataIndex[scan+1]
		equiped[scan]=equiped[scan+1]
		scan+=1
	numberItem-=1
	changed=true
	pass

func addItemByName(_name,quantity,_equiped=false):
	if(numberItem>=maxItem):
		return false
	
	var id=get_node_or_null("../../../itemDatabase")
	if(!id):
		print_debug("inv itemdatabse not found")
		return false
	
	var index=id.findItemIndex(_name)
	if(index<0):
		return
		
	thename[numberItem]=id.thename[index]
	type[numberItem]=id.type[index]
	minDmg[numberItem]=id.minDmg[index]
	maxDmg[numberItem]=id.maxDmg[index]
	dur[numberItem]=id.maxDur[index]
	opt1[numberItem]=id.opt1[index]
	opt2[numberItem]=id.opt2[index]
	opt3[numberItem]=id.opt3[index]
	dataIndex[numberItem]=index
	stack[numberItem]=quantity
	equiped[numberItem]=false
	#if(_equiped):
	#	equipi(numberItem)
	
	changed=true
	numberItem+=1
	return true	
	pass

func getStats(ind):
	var s1
	var s2
	if(type[ind]=="axe"):
		s1="Minimum Damage %s\nMaximum Damage %s\nDuribility %s\n"
		s2=s1 % [String(minDmg[ind]),String(maxDmg[ind]),String(dur[ind])]
	elif(type[ind]=="staff"):
		s1="Minimum Damage %s\nMaximum Damage %s\nDuribility %s\n"
		s2=s1 % [String(minDmg[ind]),String(maxDmg[ind]),String(dur[ind])]
	elif(type[ind]=="gun"):
		s1="Maximum Damage: %s\n Accuracy: %s\nDuribility: %s\nLoaded: %s"
		s2=s1 % [String(maxDmg[ind]),String(minDmg[ind]),String(dur[ind]),String(opt1[ind])]
	elif(type[ind]=="bow"):
		s1="Maximum Damage: %s\n Duribility: %s\nLoaded: %s"
		s2=s1 % [String(maxDmg[ind]),String(dur[ind]),String(opt1[ind])]
	elif(type[ind]=="arrow"):
		s1="Stack: %s"
		s2=s1 % String(stack[ind])
	else:
		s1="Stack: %s"
		s2=s1 % String(stack[ind])
	return s2
	pass

func addItem(_thename,_type,_mind,_maxd,_dur,_o1,_o2,_o3,_di):
	if(numberItem>=maxItem):
		return false
	thename[numberItem]=_thename
	type[numberItem]=_type
	minDmg[numberItem]=_mind
	maxDmg[numberItem]=_maxd
	dur[numberItem]=_dur
	opt1[numberItem]=_o1
	opt2[numberItem]=_o2
	opt3[numberItem]=_o3
	dataIndex[numberItem]=_di
	equiped[numberItem]=false
	
	changed=true
	numberItem+=1
	return true	
	pass


func unequipr():

	if(rtype=="none"):
		return

	if(rtype=="bow"):
		ropt1=0
		opt1[rinvindex]=0
	
	rthename="empty"
	rtype="none"
	rminDmg=0
	rmaxDmg=0
	rdur=1000
	ropt1=0
	ropt2=0
	ropt3=0
	rstack=0
	rdataIndex=-1
	
	equiped[rinvindex]=false
	#rinvindex= -1
	
	changed=true
	return true
	pass

func unequipl():
	if(ltype=="arrow" && rtype=="bow"):
		ropt1=0
		opt1[rinvindex]=0
	
	lthename="empty"
	ltype="none"
	lminDmg=0
	lmaxDmg=0
	ldur=1000
	lopt1=0
	lopt2=0
	lopt3=0
	lstack=0
	ldataIndex=-1

	equiped[linvindex]=false
	linvindex=-1
	
	changed=true
	return true
	pass



func equipr(invindex):
	
	#first detect existing equip
#	print_debug(rthename)
	if(rthename!="empty"):
		if(!unequipr()):
			return false
	
	rthename=thename[invindex]
	rtype=type[invindex]
	rminDmg=minDmg[invindex]
	rmaxDmg=maxDmg[invindex]
	rdur=dur[invindex]
	ropt1=opt1[invindex]
	ropt2=opt2[invindex]
	ropt3=opt3[invindex]
	rstack=stack[invindex]
	rdataIndex=dataIndex[invindex]
	rinvindex=invindex
	
	equiped[invindex]=true
	
	changed=true

	return true
	pass

func equipl(invindex):
	
	#first detect existing equip
	if(lthename!="empty"):
		if(!unequipl()):
			return false
	
	lthename=thename[invindex]
	ltype=type[invindex]
	lminDmg=minDmg[invindex]
	lmaxDmg=maxDmg[invindex]
	ldur=dur[invindex]
	lopt1=opt1[invindex]
	lopt2=opt2[invindex]
	lopt3=opt3[invindex]
	lstack=stack[invindex]
	ldataIndex=dataIndex[invindex]
	linvindex=invindex
	
	equiped[invindex]=true
	
	changed=true
	
	return true
	pass


func unequipb(invindex):
	bthename="empty"
	btype="none"
	bminDmg=0
	bmaxDmg=0
	bdur=1000
	bopt1=0
	bopt2=0
	bopt3=0
	bdataIndex=-1
	
	equiped[invindex]=false
	binvindex=-1
	
	changed=true
	return true
	pass

func equipb(invindex):
	
	#first detect existing equip
	if(bthename!="empty"):
		if(!unequipb(rinvindex)):
			return false
	
	bthename=thename[invindex]
	btype=type[invindex]
	bminDmg=minDmg[invindex]
	bmaxDmg=maxDmg[invindex]
	bdur=dur[invindex]
	bopt1=opt1[invindex]
	bopt2=opt2[invindex]
	bopt3=opt3[invindex]
	bdataIndex=dataIndex[invindex]
	binvindex=invindex
	
	equiped[invindex]=true
	
	changed=true
	
	return true
	pass

func clearInv():
	#print_debug("clearInv")
	
	numberItem=0
	rthename="empty"
	rtype="none"
	rminDmg=1
	rmaxDmg=2
	rdur=1000
	ropt1=0
	ropt2=0
	ropt3=0
	rstack=0
	rdataIndex=0
	rinvindex=0

	lthename="empty"
	ltype="none"
	lminDmg=1
	lmaxDmg=2
	ldur=1000
	lopt1=0
	lopt2=0
	lopt3=0
	lstack=0
	ldataIndex=0
	linvindex=0

	bthename="empty"
	btype="none"
	bminDmg=1
	bmaxDmg=2
	bdur=1000
	bopt1=0
	bopt2=0
	bopt3=0
	bdataIndex=1
	binvindex=0

	changed=true
	pass
