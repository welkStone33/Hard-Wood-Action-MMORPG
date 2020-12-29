extends Area

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


#Keeps a list of Area's that have collided
#with the area this script is attached.
#Attaches on the area node.

var list=[1,2]
var listtype=["none","none"]
var listnumber=0
var listmax=5

var pruneTime=5
var pruneTimer=0


var findType=["player","mob"]
var numberFindType=2

#var main=null
#var clientSync=false

func _ready():
#	main=get_node("..")
	#list.resize(listmax)
	#listtype.resize(listmax)
	setSize(listmax)
	findType.resize(20)
	register_signals()
	pass # Replace with function body.

func removeType(thetype):

	var scan=0
	while (scan<numberFindType):
		if(findType[scan]==thetype):
			findType[scan]=findType[numberFindType-1]
			numberFindType-=1
			return
		scan+=1
	pass

#for optimizations, filters out types not registered
func addType(thetype):
	findType[numberFindType]=thetype
	numberFindType+=1
	pass

func register_signals():
	var _test=self.connect("area_entered",self,"_area_entered")
	_test=self.connect("area_exited",self,"_area_exited")
	pass

func _area_entered(thearea):
	#print_debug("area entered")
		
	if(test_type(thearea)==true):
		addtolist(thearea)		
		
	pass
	

func _area_exited(thearea):
	#print_debug("exit area")
	removefromlist(thearea)
	pass
	
	
func addtolist(thearea):
	check_list_size()
	if(listnumber>=listmax):
		return
		
	var typenode=thearea.get_node_or_null("typeNode")
	if(!typenode):
		return
	list[listnumber]=thearea
	listtype[listnumber]=typenode.type
	
#	if(clientSync):
#		var pm=main.con.get_node("playerMove")
#		if(listtype[listnumber]=="mob"):
#			var mo=main.con.get_node("mobs")
#			var ai=listmain[listnumber].get_node_or_null("AISync")
#			if(ai):
#				mo.rpc_id(main.theid,"addMobPiece",ai.theid,ai.thename,listmain[listnumber].transform.origin,listmain[listnumber].rotation_detrees)
		
	
	listnumber=listnumber+1
	pass	
	
func removefromlist(thearea):
	var i=findareaindex(thearea)
	removefromlisti(i)
	
	pass	

func removefromlisti(i):
	if(i>=0):
		list[i]=list[listnumber-1]
		listtype[i]=listtype[listnumber-1]
		listnumber=listnumber-1
		
	
	pass	

	
func findareaindex(thearea):
	var scan=0
	while(scan<listnumber):
		if(list[scan]==thearea):
			return scan
		scan=scan+1
	return -1
	pass	
	
func test_type(thearea):
	#var register=false
	
	if(thearea==self):
		return false
	
	var typenode=thearea.get_node_or_null("typeNode")
	if(typenode==null):#not a type that can be listed
		return false
		
	var scan=0
	while (scan<numberFindType):
		if(typenode.type==findType[scan]):
			return true
		scan+=1

	return false
	pass	
	
#godot normally calls area exit when this happens
func cleanNull(delta):
	pruneTimer=pruneTimer+delta
	if(pruneTimer<pruneTime):
		return
	pruneTimer=0
	var scan=0
	while (scan<listnumber):
		if(list[scan]==null):
			removefromlisti(scan)
			scan=scan-1
		scan=scan+1
	pass	
	
func setSize(num):
	list.resize(num)
	listtype.resize(num)
	listmax=num
	pass
	
func check_list_size():
#	if(listnumber+1<listmax-10):
#		list.resize(listnumber+10)
#		listmax=listnumber+10
	if(listnumber+1>=listmax):
		list.resize(listnumber+10)
		listtype.resize(listnumber+10)
		listmax=listnumber+10
	pass
	
func getClosestType(v,atype):
	var dis=100000
	var ndis=0
	var scan=0
	var r=null
	while (scan<listnumber):
		if(listtype[scan]==atype):
			ndis=v.distance_to(list[scan].global_transform.origin)
			if(ndis<dis):
				r=list[scan]
				dis=ndis
		
		scan=scan+1
	return r
	pass	
	
#func _process(delta):
#	cleanNull(delta)
#	pass
	
	
	
	
