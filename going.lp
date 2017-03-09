%Test

person(1..2).
place(shop).
place(uni).
timestep(1..3).

1{go(P,L,T) : person(P),place(L) }1 :- timestep(T).

at(P,L,T) :- go(P,L,T), person(P), place(L), timestep(T).




%Don't go to a place you're at
:- at(P,L,T),go(P,L,T+1).

#show go/3.
#show at/3.
