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


#For a way to keep track of day light and night time
#and for simulating day and night with a directional
#light. The server and client access this node
#to know the ingame time.


#A time of 0 is 12:00PM

var dayTime=0 #keeping track of day time minute

var calibratedFullRot=0
var fullTime=1800.0 #1800 seconds one day (30min)
#var fullTime=30

var quarterTime=0
#24
var fullDay=24.0 #24 hours for a full day
var fullDayCal=0

#60
var fullHour=60.0  #seconds minute
#var fullHourCal=0

#60
var fullMinute=60.0 #seconds for a minute
#var fullMinuteCal=0

var runTime=0.1
var runTimer=0

var thehour=0
var theminute=0
var ampm=0


var sunOrbit=null
var light=null
var ison=true

var cam=null
var originalBackColor=Color(1,1,1,1)
var eveningColor=0.4
var nightBackColor : Color=Color(0.1,0.1,0.1)
var dimHourRater
var dimHourRateg
var dimHourRateb


var oneSecond=0
var fps=0
var lastfps=0

# Called when the node enters the scene tree for the first time.
func _ready():
	cam=get_node("../../Camera")
	sunOrbit=get_node("sunOrbit")
	light=sunOrbit.get_node("DirectionalLight")

	quarterTime=fullTime*0.25
	
	#how many 24 hour sections inside Time
	fullDayCal=fullDay/fullTime

	
	calibratedFullRot=360/fullTime
	
	if(cam):
		if(cam.environment):
			originalBackColor=cam.environment.background_color

#	dimHourRater= (originalBackColor.r-nightBackColor.r)/quarterTime #1/6
#	dimHourRateg= (originalBackColor.g-nightBackColor.g)/quarterTime #1/6
#	dimHourRateb= (originalBackColor.b-nightBackColor.b)/quarterTime #1/6
	dimHourRater= (originalBackColor.r-(eveningColor*originalBackColor.r))/quarterTime #1/6
	dimHourRateg= (originalBackColor.g-(eveningColor*originalBackColor.g))/quarterTime #1/6
	dimHourRateb= (originalBackColor.b-(eveningColor*originalBackColor.b))/quarterTime #1/6

	
	
	pass # Replace with function body.


func checkTime():
	
	if(dayTime>fullTime):
		dayTime=(dayTime-fullTime)
		#print_debug("reset dayTime")
	
	if(dayTime==0):
		thehour=0
		theminute=0
	else:
		var i : int
		thehour=dayTime*fullDayCal
		i=thehour
		theminute= thehour-i
		thehour=thehour-theminute
		theminute=theminute*fullMinute
		i=theminute
		theminute=theminute-(theminute-i)
#		print_debug(thehour)
#		print_debug(theminute)
		
		
	
	
	pass

func checkLight():
	var therot
	therot=calibratedFullRot*dayTime
	#print_debug(therot)
	if(therot>=90 && therot<=270):
		if(ison):
			ison=false
			light.hide()
		#lights off
	if(therot>=270 && therot<=360):
		#lights on
		if(!ison):
			ison=true
			light.show()
		#self.rotation_degrees.z = -90
	if(therot>=0 && therot<=89):
		#lights on
		if(!ison):
			ison=true
			light.show()
		#self.rotation_degrees.z = -90
		
	pass

func runRot():
	var therot
	therot=calibratedFullRot*dayTime
	sunOrbit.rotation_degrees.z=therot
	pass

func runBack():
	if(!cam):
		return
	if(!cam.environment):
		return
		
	if(thehour>=6 && thehour<=17):
		cam.environment.background_color=nightBackColor
	else:
		var rate : Color=Color(0,0,0)
		if(dayTime>=(quarterTime*3) && dayTime<fullTime):
			rate.r=dimHourRater*(dayTime-(quarterTime*3))
			rate.g=dimHourRateg*(dayTime-(quarterTime*3))
			rate.b=dimHourRateb*(dayTime-(quarterTime*3))
			rate.r+=(eveningColor*originalBackColor.r)
			rate.g+=(eveningColor*originalBackColor.g)
			rate.b+=(eveningColor*originalBackColor.b)
		if(dayTime>=0 && dayTime<=quarterTime):
			rate.r=dimHourRater*(quarterTime-dayTime)
			rate.g=dimHourRateg*(quarterTime-dayTime)
			rate.b=dimHourRateb*(quarterTime-dayTime)
			rate.r+=(eveningColor*originalBackColor.r)
			rate.g+=(eveningColor*originalBackColor.g)
			rate.b+=(eveningColor*originalBackColor.b)
			
		cam.environment.background_color=rate
	pass

func doFps(delta):
	
	fps+=1
	oneSecond+=delta
	if(oneSecond>=1):
		oneSecond=0
		lastfps=fps
		fps=0
		#print_debug(lastfps)
		var hud=get_node("../hudNode")
		hud.addMsg(String(lastfps))
	
	pass

func _process(delta):
#	doFps(delta)

	dayTime+=delta
	
	runTimer+=delta
	if(runTimer<runTime):
		return
	runTimer=0
	checkTime()
	runRot()
	checkLight()
	runBack()
	
	
	pass
