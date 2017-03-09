%Test

person(a).
person(b).
place(shop).
place(uni).
timestep(1..3).

1{go(P,L,T) : person(P),place(L) }1 :- timestep(T).

on(P,L,T) :- go(P,L,T), person(P), place(L), timestep(T).




%Don't go to same place twice
%:- go(P,L,T) , go(P,L,T+N), N = 1..3.

#show go/3.
#show isAt/2.