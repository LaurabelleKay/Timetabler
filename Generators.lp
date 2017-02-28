%We can generate using { }
 person(alice).
 person(bob).
 person(carol).
 person(eve).
 
 %There is an assignment that 0 to 4 people can go on.
 
 {assignment(P)} :- person(P).
 
 %Generates all possible combinations.