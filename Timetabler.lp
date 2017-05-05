%** @block Timetabler {
Timetabler which creates a tmetable based on inputs...
*%

%**
	@atom day(1..5)
	number of teaching days

	@atom timestep(9..18)
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

	@atom lec(U,R,L,T,D)
	Scheduled lecture for a unit

	@input student/1, unit/1, lecturer/1, room/1, takes/2, teaches/2,
 	unavailable/2, capacity/2, preferred/3, day/1, timestep/1

	@output lec/5.
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
	%Generate greather than 4 lectures a week, between 3 and 7 lectures per unit,
	and no more than 2 lectures for one unit in the same day.
*%

	%**
		@atom lecture(U,R,L,T,D)
		A scheduled lecture.

		@output lecture/5.
	*%

	4 {lecture(U,R,L,T,D):unit(U),room(R),lecturer(L),timestep(T)} :- day(D).
	2 {lecture(U,R,L,T,D):room(R),lecturer(L),timestep(T),day(D)} 7 :- unit(U).
	{lecture(U,R,L,T,D):room(R),lecturer(L),timestep(T)} 2 :- unit(U),day(D).
%** }*%

%** @block Student {
	Defines a studen't scheduled lectures, times when the student is busy, what
	room a student is in at a given time, and whether or not they have a lunch
	break.
*%

	%*A student is at a lecture at a certain time if there is a scheduled lecture
	for a unit they take*%
	at(S,U,R,L,T,D) :- lecture(U,R,L,T,D), takes(S,U).
	at(S,U,T,D) :- at(S,U,_,_,T,D).
	busy(S,T,D) :- at(S,_,T,D).
	in(S,R,T,D) :- at(S,_,R,_,T,D).

	%A student has a lunch period if they have no lecture at 12
	hasLunch(S) :- not busy(S,12,D), student(S), day(D).
	%hasLunch(S) :- not busy(S,13,D), student(S), day(D).

	%Count the number of students that have a lunch period
	lunch(N) :- N = #count{student(S) : hasLunch(S)}.
	%Maximise the number of students with a lunch period
	#maximize {A@1 : lunch(N), A = N}.

	%** @postcon StudentClash {
		A student cannot attend 2 lectures at the same time
		@never clash

		clash :- at(S,U1,T,D), at(S,U2,T,D), U1 != U2.
	}*%

	clash :- at(S,U1,T,D), at(S,U2,T,D), U1 != U2.
%** }*%

%** @block Lecturer {
	Defines when a lecturer is teaching, and if they are teaching at their
	preferred time
*%
	teaching(L,U,R,T,D) :- lecture(U,R,L,T,D), teaches(L,U).
	teaching(U,L,T,D) :- teaching(L,U,_,T,D).
	teaching(L,T,D) :- teaching(_,L,T,D).
	teaching(L,U) :- lecture(U,_,L,_,_).

	%**
		@precon PreferredClash {
		A lecturer cannot have preferred lecturetime that is the same as
		an unavailable time
		@never clash

		clash :- unavailable(L,T,D), preferred(L,T,D).
	}*%

	clash :- unavailable(L,T,D), preferred(L,T,D).

	hasPreferred(L) :- teaching(L,T,D), preferred(L,T,D).

	%Count the number of times a lecturer is teaching at their preferred time
	preferred(P) :- P = #count{lecturer(L) : hasPreferred(L)}.
	%Maximise the number of times a lecturer has a preferred itme
	#maximize {B@2 : preferred(P), B = P}.

	%** @postcon LecturerClash {
		A lecturer cannot teach 2 lectures at the same time
		@never clash

		clash :- teaching(U1,L,T,D), teaching(U2,L,T,D), U1 != U2.
	}*%

	clash :- teaching(U1,L,T,D), teaching(U2,L,T,D), U1 != U2.

	%** @postcon Unavailable {
		A lecturer cannot lecture when they are unavailable
		@never unavail
		unavail :- teaching(L,D,T), unavailable(L,D,T).
	}*%

	unavail :- teaching(L,D,T), unavailable(L,D,T).

	%** @postcon wrongUnit {
		A lecturer cannot have a lecture for a unit they do not teach
		@never wrongU
		wrongU :- teaching(L,U) , not teaches(L,U).
	}*%

	wrongU :- teaching(L,U) , not teaches(L,U).

%** }*%

%** @block Room {
	Defines when a room is in use, and when a unit is being taught in that room
*%
	inUse(R,U,T,D) :- lecture(U,R,_,T,D).

	%Count the number of students in a room at a certain time
	occupying(N,R,T,D) :- N = #count{student(S) : in(S,R,T,D)} , room(R), timestep(T), day(D).

	%** @postcon OverCapacity {
		Do not schedule a lecture for a unit in a room with a smaller capacity than
		the number of students taking that unit
		@never overCapacity
		overCapacity :- occupying(N,R,T,D), capacity(R,Z), N > Z.
	}*%

	overCapacity :- occupying(N,R,T,D), capacity(R,Z), N > Z.

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
:- duplicate.
:- overCapacity.

lec(U,R,L,T,D) :- at(_,U,R,L,T,D).
#show lec/5.

%** } *%
