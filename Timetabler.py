import sys
import json

datat = open('output').read()
data = json.loads(datat)

f = data["Call"][0]["Witnesses"][0]["Value"]
i = len(data["Call"][0]["Witnesses"])
optimum = data["Models"]["Opt"]

for x in range(0,i):
     if data["Call"][0]["Witnesses"][x]["Opt"] == optimum:
         optimum_value = x

values_count = len(data["Call"][0]["Witnesses"][optimum_value]["Value"])
value = [0] * values_count

d,t = 6, 11
Matrix = [[0 for x in range(d)] for y in range(t)]
Matrix[0][1] = "Monday"
Matrix[0][2] = "Tuesday"
Matrix[0][3] = "Wednesday"
Matrix[0][4] = "Thursday"
Matrix[0][5] = "Friday"

for x in range (1,11):
    Matrix[x][0] = x + 8

for x in range (0,values_count):
    value[x] = data["Call"][0]["Witnesses"][optimum_value]["Value"][x]

temp = [0] * values_count
roomList = []

for x in range (0,values_count):
    studentNo,unit,room,lecturer,time,day = value[x].split(",")
    if room not in roomList:
        roomList.append(room)
maxInfo = 0

for x in range (0,len(roomList)):
    Matrix[0][0] = roomList[x]
    for y in range (0,values_count):
        studentNo,unit,room,lecturer,time,day = value[y].split(",")
        info = unit + ", " + lecturer
        if len(info) > maxInfo:
            maxInfo = len(info)
        day = day.rstrip(')')
        Matrix[int(time) - 8][int(day)] = info


for x in range (0,11):
    for y in range (0,6):
        print(Matrix[x][y],end = '')
        spaces = maxInfo - len(Matrix[x][y])
        for z in range(0,spaces):
            print(" ", end = '')
    print("\n")

#for x in range (0,values_count):
#    studentNo,unit,room,lecturer,time,day = value[x].split(",")
#    day = day.rstrip(')')

#studentNo,unit,room,lecturer,time,day = g.split(",")
#studentNo = studentNo[3:]
#day = day.rstrip(')')
#print(studentNo)
#print(unit)
#print(room)
#print(lecturer)
#print(time)
#print(day)
