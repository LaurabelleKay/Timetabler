from __future__ import print_function
import sys
import json


data = json.load(sys.stdin)

f = data["Call"][0]["Witnesses"][0]["Value"]
i = len(data["Call"][0]["Witnesses"])
optimum = data["Models"]["Opt"]

for x in range(0,i):
     if data["Call"][0]["Witnesses"][x]["Opt"] == optimum:
         optimum_value = x

values_count = len(data["Call"][0]["Witnesses"][optimum_value]["Value"])
value = [0] * values_count

d,t = 6, 11
Matrix = [["---" for x in range(d)] for y in range(t)]
Matrix[0][1] = "Monday"
Matrix[0][2] = "Tuesday"
Matrix[0][3] = "Wednesday"
Matrix[0][4] = "Thursday"
Matrix[0][5] = "Friday"

for x in range (1,11):
    Matrix[x][0] = x + 8

for x in range (0,values_count):
    value[x] = data["Call"][0]["Witnesses"][optimum_value]["Value"][x]

roomList = []

for x in range (0,values_count):
    unit,room,lecturer,time,day = value[x].split(",")
    if room not in roomList:
        roomList.append(room)
maxInfo = 0

for x in range (0,len(roomList)):
    Matrix[0][0] = "Room: " + roomList[x]
    for y in range (0,values_count):
        unit,room,lecturer,time,day = value[y].split(",")
        unit = unit[4:]
        info = unit + ", " + lecturer
        if len(info) > maxInfo:
            maxInfo = len(info)
        day = day.rstrip(')')
        if room == roomList[x]:
            Matrix[int(time) - 8][int(day)] = info
        else:
            Matrix[int(time) - 8][int(day)] = "---"
    for x in range (0,11):
        for y in range (0,6):
            print(Matrix[x][y],end = ' ')
            spaces = maxInfo - len(str(Matrix[x][y]))
            for z in range(0,spaces):
                print(" ", end = '')
        print("\n")
    print("\n")

#studentNo = studentNo[3:]
