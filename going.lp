%Test

person(malon).
person(saria).
place(kakarikoVillage).
place(lostWoods).
timestep(1..4).

1{go(P,L,T) : person(P),place(L) }1 :- timestep(T).

at(P,L,T) :- go(P,L,T), person(P), place(L), timestep(T).

%Don't go to a place you're at
:- at(P,L,T),go(P,L,T+N), N = 1..3. 

%Needs to be LIFO for people going
%isAfter(P1,P2,L) :- at(P1,L,T), at(P2,L,T-N), person(P1), person(P2), place(L), timestep(T), N=1..2.
%Don't want someone after themselves
%:- isAfter(P1,P2,L), P1 == P2.
#show go/3.
%#show at/3.
#show isAfter/3.
#show stillThere/3.
