#const n = 3.
location(1..n).
block(1..n).
#const t = (2**n) - 1.
timestep(1..t).

1{move(B,L,T) : block(B),location(L)}1 :- timestep(T).
at(B,L,T) :- go(B,L,T), block(B), location(L), timestep(T).

%Only one disk can be moved at a time.
%Each move consists of taking the upper disk from one of the stacks and
placing it on top of another stack i.e. a disk can only be moved if it is the
uppermost disk on a stack.
%No disk may be placed on top of a smaller disk.


#show move/3.
%Don't move block to a location it's on
:-at(P,L,T), go(P,L,T+1).



