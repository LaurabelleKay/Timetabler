The timetabler application is run using command 1: clingo input.lp Timetabler.lp
where input is one of the input files provided.

The output atoms are in the form lec(U,R,L,T,D) where: U is the unit, R is the room, L is the lecturer and T and D are the time and day respectively.

In order to display the output as a table, use command 2: clingo input.lp Timtabler.lp --outf=2 | python Timetabler.py.
This output is a timetable for every room with lectures scheduled in them.

Constraint Test input files have 'ConstraintTest' at the end of their names and should be run using command 1, other input files / test files may be run using either command.

3 input files Input1.lp, Input2.lp and Input3.lp produce a timetable.
1 input file Input4.lp fails to produce a timetable.
There are 4 files which test that the constraints cannot be violated.
NoLunch.lp and NoPreferred.lp test the weak constraints.
