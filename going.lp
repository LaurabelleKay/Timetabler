%Test

person(malon).
person(saria).
place(kakarikoVillage).
place(lostWoods).
timestep(0..2).

1{go(P,L,T) : person(P),place(L) }1 :- timestep(T).

initiallyAt(P,lostWoods) :- person(P).

%Only one person can go at a time(Done)
%A person shouldn't go to where they're at
%initial :- go(P,lostwoods,T), person(P), first(T).
%:- initial.

#show go/3.
#show initiallyAt/2.
