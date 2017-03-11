%Test

person(malon).
person(saria).
place(kakarikoVillage).
place(lostWoods).
place(castle).
timestep(1..3).

1{go(P,L,T) : person(P),place(L) }1 :- timestep(T).

initiallyAt(P,lostWoods) :- person(P).
:- go(P,lostWoods,1), person(P).

%Only one person can go at a time(Done)
%A person shouldn't go to where they're at
:- go(P,L1,T), go(P,L2,T+N), not go(P,L3,T+(N-1)), person(P), place(L), L1 == L2, time(T), N = 1..2, L3 != L1.

%initial :- go(P,lostwoods,T), person(P), first(T).
%:- initial.

#show go/3.
