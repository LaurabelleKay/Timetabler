%** @block Timetabler {
Timetabler which creates a tmetable based on inputs...
*%

%**
	@atom day(1..2)
	number of teaching days

	@atom timestep(9..12)
	range of teaching hours defined as 9am to 6pm

	@atom student(S)
	A student

	@atom unit(U)
	A unit

	@atom lecturer(L)
	A lecturer

	@atom room(R)
	A room

	@atom takes(S,U)
	Student S takes unit U

	@atom teaches(L,U)
	Lecturer L teaches unit U

	@atom unavailable(L,T,D)
	Lecturer L is unavailable at time T on day D

	@atom capacity(R,Z)
	Room R has capacity Z

	@atom preferred(L,T,D)
	Lecturer L's preferred teaching times

	@input student/1, unit/1, lecturer/1, room/1, takes/2, teaches/2,
 	unavailable/2, capacity/2, preferred/3, day/1, timestep/1

	@output at/6
*%

%** @term S
	A student number
*%

%** @term U
	A unit code/name
*%

%** @term L
	The name of a lecturer
*%

%** @term R
	A room number
*%

%** @term Z
	The number of students a room can hold
*%

%** @term T
	A time in the day which ranges from 09:00 to 18:00
	@from 9,10,11,12,13,14,15,16,17,18
*%

%** @term D
	A day in the week ranging form Monday to Friday
	@from 1,2,3,4,5

*%

%** @block Schedule {
	%Generate between _ and _ lectures a day. For each unit, generate between _ and _ lectures a week
*%
	1 {lecture(U,R,L,T,D):unit(U),room(R),lecturer(L),timestep(T)} :- day(D).
	3 {lecture(U,R,L,T,D):room(R),lecturer(L),timestep(T),day(D)} 6 :- unit(U).
%** }*%

%** @block Student {
	A student is at a lecture, if there is a scheduled lecture for a unit, and the student takes that unit
*%
	at(S,U,R,L,T,D) :- lecture(U,R,L,T,D), takes(S,U).
	at(S,U,T,D) :- at(S,U,_,_,T,D).
	busy(S,T,D) :- at(S,_,T,D).

	%** @postcon StudentClash {
		A student cannot attend 2 lectures at the same time
		@never clash

		clash :- at(S,U1,T,D), at(S,U2,T,D), U1 != U2.
	}*%

	clash :- at(S,U1,T,D), at(S,U2,T,D), U1 != U2.


	hasLunch(S) :- not busy(S,12,D), student(S), day(D).
	hasLunch(S) :- not busy(S,13,D), student(S), day(D).

%** }*%

%** @block Lecturer {
	A lecturer is teaching, if there is a lecture scheduled and the lecturer teaches that unit
*%
	teaching(L,U,R,T,D) :- lecture(U,R,L,T,D), teaches(L,U).
	teaching(U,L,T,D) :- teaching(L,U,_,T,D).
	teaching(L,T,D) :- teaching(_,L,T,D).
	teaching(L,U) :- lecture(U,_,L,_,_).

%#show teaching/3.
%**
	@precon PreferredClash {
	A lecturer cannot have preferred lecturetime that is the same as unavailable time
	@never clash

	clash :- unavailable(L,T,D), teaching(L,T,D).
	}
*%

%** @postcon LecturerClash {
	A lecturer cannot teach 2 lectures at the same time
	@never clash

	clash :- teaching(U1,L,T,D), teaching(U2,L,T,D), U1 != U2.
}*%

%** @postcon Unavailable {
	A lecturer cannot lecture when they are unavailable
	@never unavail
	unavail :- teaching(L,D,T), unavailable(L,D,T).
}*%

%** @postcon wrongUnit {
	A lecturer cannot have a lecture for a unit they do not teach
	@never wrongU
	wrongU :- teaching(L,U) , not teaches(L,U).
}*%

	clash :- unavailable(L,T,D), teaching(L,T,D).
	clash :- teaching(U1,L,T,D), teaching(U2,L,T,D), U1 != U2.
	wrongU :- teaching(L,U) , not teaches(L,U).
	unavail :- teaching(L,D,T), unavailable(L,D,T).

%** }*%

%** @block Room {
	A room is in use if there is a lecture scheduled in that room
*%
	inUse(R,U,T,D) :- lecture(U,R,_,T,D).

	%** @postcon RoomClash {
		A room cannot be used for 2 lectures at the same time
		@never clash
		clash :- inUse(R,U1,T,D), inUse(R,U2,T,D), U1 != U2.
	}*%

	clash :- inUse(R,U1,T,D), inUse(R,U2,T,D), U1 != U2.

%** }*%

%** @block Unit {
	A unit is being taught if there is a lecture scheduled for that unit
*%
	beingTaught(U,R,T,D) :- lecture(U,R,_,T,D).

	%** @postcon DuplicateUnit {
		The same unit cannot be taught in 2 separate lectures
		@never duplicate
		duplicate :- beingTaught(U,R1,T,D), beingTaught(U,R2,T,D), R1 != R2.
	}*%

	duplicate :- beingTaught(U,R1,T,D), beingTaught(U,R2,T,D), R1 != R2.
%** } *%

:- clash.
:- wrongU.
:-unavail.

hasPreferred(L) :- teaching(L,T,D), preferred(L,T,D).
lunch(N) :- N = #count{student(S) : hasLunch(S)}.
preferred(P) :- P = #count{lecturer(L) : hasPreferred(L)}.
#maximize {A@1 : preferred(P), A = P}.
#maximize {B@2 : lunch(N), B = N}.

#show at/6.
%** } *%
