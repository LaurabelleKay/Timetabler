%Test

person(malon).
person(saria).
place(kakarikoVillage).
place(lostWoods).
timestep(1..3).

1{go(P,L,T) : person(P),place(L) }1 :- timestep(T).

%Only one person can go at a time.
%Each move consists of taking the upper disk from one of the stacks and
%placing it on top of another stack i.e. a disk can only be moved if it is the
%uppermost disk on a stack.
%No disk may be placed on top of a smaller disk.


%Needs to be LIFO for people going
%isAfter(P1,P2,L) :- at(P1,L,T), at(P2,L,T-N), person(P1), person(P2), place(L), timestep(T), N=1..2.
%Don't want someone after themselves
%:- isAfter(P1,P2,L), P1 == P2.
#show go/3.
