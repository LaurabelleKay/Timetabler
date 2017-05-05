timestep(9..18).
day(1..5).
student(1..24).
unit(electronics;programming;mathematics;dataStructures).

takes(1,electronics;1,programming;1,mathematics).
takes(2,electronics;2,programming;2,mathematics).
takes(3,electronics;3,programming;3,mathematics).
takes(4,electronics;4,programming;4,mathematics).
takes(5,electronics;5,programming;5,mathematics).
takes(6,electronics;6,programming;6,mathematics).
takes(7,electronics;7,programming;7,mathematics).
takes(8,electronics;8,programming;8,mathematics).

takes(9,dataStructures;9,programming;9,mathematics).
takes(10,dataStructures;10,programming;10,mathematics).
takes(11,dataStructures;11,programming;11,mathematics).
takes(12,dataStructures;12,programming;12,mathematics).
takes(13,dataStructures;13,programming;13,mathematics).
takes(14,dataStructures;14,programming;14,mathematics).
takes(15,dataStructures;15,programming;15,mathematics).
takes(16,dataStructures;16,programming;16,mathematics).


lecturer(a).
lecturer(b).


teaches(a,electronics;a,programming).
teaches(b,mathematics;b,dataStructures).

preferred(a,11,1).
preferred(b,11,2).

unavailable(a,10,1;a,11,2).
unavailable(b,9,1;b,10,2).

room(101;102;103;104;105;106).

capacity(101,10 ; 102,6 ; 103,30 ; 104,10 ; 105,8 ; 106,5).

%* OUTPUT
Models       : 1
  Enumerated : 5
  Optimum    : yes
Optimization : 3 276
Calls        : 1
Time         : 1.423s (Solving: 0.46s 1st Model: 0.26s Unsat: 0.03s)
CPU Time     : 1.400s
lk411@tux2:~/AI-ASP-public/Timetabler$ ^C
lk411@tux2:~/AI-ASP-public/Timetabler$ ^C
lk411@tux2:~/AI-ASP-public/Timetabler$ clingo Input2.lp Timetabler.lp
clingo version 4.2.1
Reading from Input2.lp ...
Solving...
Answer: 1
lec(electronics,101,a,9,1) lec(electronics,101,a,11,1) lec(programming,103,a,12,1) lec(programming,103,a,13,1) lec(mathematics,103,b,10,1) lec(mathematics,103,b,14,1) lec(dataStructures,101,b,15,1) lec(dataStructures,101,b,16,1) lec(electronics,101,a,9,2) lec(electronics,101,a,10,2) lec(programming,103,a,12,2) lec(programming,103,a,14,2) lec(mathematics,103,b,13,2) lec(dataStructures,101,b,15,2) lec(dataStructures,101,b,16,2) lec(electronics,101,a,9,3) lec(mathematics,103,b,13,3) lec(mathematics,103,b,14,3) lec(dataStructures,101,b,16,3) lec(programming,103,a,9,4) lec(mathematics,103,b,11,4) lec(dataStructures,101,b,12,4) lec(dataStructures,101,b,13,4) lec(electronics,101,a,13,5) lec(electronics,101,a,14,5) lec(programming,103,a,10,5) lec(programming,103,a,11,5) lec(mathematics,103,b,9,5)
Optimization: 2 248
Answer: 2
lec(electronics,101,a,9,1) lec(electronics,101,a,11,1) lec(programming,103,a,12,1) lec(programming,103,a,13,1) lec(mathematics,103,b,14,1) lec(dataStructures,101,b,15,1) lec(dataStructures,101,b,16,1) lec(programming,103,a,12,2) lec(programming,103,a,14,2) lec(mathematics,103,b,11,2) lec(mathematics,103,b,13,2) lec(dataStructures,101,b,16,2) lec(electronics,101,a,12,3) lec(programming,103,a,10,3) lec(mathematics,103,b,13,3) lec(mathematics,103,b,14,3) lec(dataStructures,101,b,15,3) lec(dataStructures,101,b,16,3) lec(electronics,101,a,10,4) lec(electronics,101,a,12,4) lec(mathematics,103,b,11,4) lec(dataStructures,101,b,14,4) lec(dataStructures,101,b,15,4) lec(electronics,101,a,13,5) lec(electronics,103,a,12,5) lec(programming,103,a,10,5) lec(programming,103,a,11,5) lec(mathematics,103,b,9,5)
Optimization: 1 256
Answer: 3
lec(electronics,101,a,9,1) lec(electronics,101,a,11,1) lec(programming,103,a,12,1) lec(programming,103,a,13,1) lec(mathematics,103,b,10,1) lec(mathematics,103,b,14,1) lec(dataStructures,101,b,15,1) lec(dataStructures,101,b,16,1) lec(electronics,101,a,10,2) lec(programming,103,a,12,2) lec(programming,103,a,14,2) lec(mathematics,103,b,11,2) lec(mathematics,103,b,13,2) lec(dataStructures,101,b,16,2) lec(programming,103,a,10,3) lec(mathematics,103,b,13,3) lec(mathematics,103,b,14,3) lec(dataStructures,101,b,15,3) lec(dataStructures,101,b,16,3) lec(electronics,101,a,10,4) lec(electronics,101,a,12,4) lec(mathematics,103,b,11,4) lec(dataStructures,101,b,14,4) lec(dataStructures,101,b,15,4) lec(electronics,101,a,13,5) lec(electronics,103,a,12,5) lec(programming,103,a,10,5) lec(programming,103,a,11,5)
Optimization: 1 248
OPTIMUM FOUND

Models       : 1
  Enumerated : 3
  Optimum    : yes
Optimization : 1 248
Calls        : 1
Time         : 0.738s (Solving: 0.21s 1st Model: 0.18s Unsat: 0.03s)
CPU Time     : 0.720s
*%
