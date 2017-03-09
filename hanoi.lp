#const n = 3.
location(1..n).
block(1..n).
#const t = (2**n) - 1.
timestep(1..t).

1{move(B,L,T) : block(B),location(L)}1 :- timestep(T).
at(B,L,T) :- go(B,L,T), block(B), location(L), timestep(T).


#show move/3.
%Don't move block to a location it's on
:-at(P,L,T), go(P,L,T+1).



