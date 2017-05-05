timestep(9..18).
day(1..5).
student(1..32).
unit(electronics;programming;mathematics;mechanics;dataStructures;physics).

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

takes(17,mechanics;17,programming;17,mathematics;17,pyhisics).
takes(18,mechanics;18,programming;18,mathematics).
takes(19,mechanics;19,programming;19,mathematics).
takes(20,mechanics;20,programming;20,mathematics).
takes(21,mechanics;21,programming;21,mathematics).
takes(22,mechanics;22,programming;22,mathematics).
takes(23,mechanics;23,programming;23,mathematics).
takes(24,mechanics;24,programming;24,mathematics).

takes(24..32,physics).

lecturer(a).
lecturer(b).
lecturer(c).
lecturer(d).

teaches(a,electronics;a,programming).
teaches(b,mathematics;b,dataStructures).
teaches(c,mechanics).
teaches(d,physics).

preferred(a,11,1).
preferred(b,11,2).
preferred(c,16,1).
preferred(d,16,1).

unavailable(a,10,1;a,11,2).
unavailable(b,9,1;b,10,2).
unavailable(c,13,1;c,16,2).

room(101;102;103;104;105;106).

capacity(101,10 ; 102,10 ; 103,30 ; 104,10 ; 105,10 ; 106,10).

%* OUTPUT
Models       : 1
  Enumerated : 3
  Optimum    : yes
Optimization : 1 248
Calls        : 1
Time         : 0.738s (Solving: 0.21s 1st Model: 0.18s Unsat: 0.03s)
CPU Time     : 0.720s
lk411@tux2:~/AI-ASP-public/Timetabler$ ^C
lk411@tux2:~/AI-ASP-public/Timetabler$ clingo Input3.lp Timetabler.lp
clingo version 4.2.1
Reading from Input3.lp ...
Solving...
Answer: 1
lec(electronics,101,a,9,1) lec(electronics,101,a,11,1) lec(programming,103,a,12,1) lec(programming,103,a,13,1) lec(dataStructures,101,b,10,1) lec(dataStructures,101,b,14,1) lec(mathematics,103,b,15,1) lec(mechanics,101,c,17,1) lec(mechanics,101,c,18,1) lec(physics,102,d,9,1) lec(physics,102,d,10,1) lec(electronics,101,a,9,2) lec(programming,103,a,12,2) lec(dataStructures,101,b,11,2) lec(mathematics,103,b,15,2) lec(mathematics,103,b,16,2) lec(mechanics,101,c,17,2) lec(mechanics,101,c,18,2) lec(physics,102,d,9,2) lec(physics,102,d,10,2) lec(mathematics,103,b,12,3) lec(mathematics,103,b,13,3) lec(mechanics,101,c,17,3) lec(mechanics,101,c,18,3) lec(physics,102,d,9,3) lec(physics,102,d,10,3) lec(electronics,101,a,9,4) lec(electronics,101,a,11,4) lec(programming,103,a,10,4) lec(programming,103,a,12,4) lec(dataStructures,101,b,13,4) lec(dataStructures,101,b,14,4) lec(electronics,101,a,10,5) lec(electronics,101,a,11,5) lec(programming,103,a,12,5) lec(programming,103,a,13,5) lec(dataStructures,101,b,14,5) lec(dataStructures,101,b,15,5) lec(mathematics,103,b,16,5) lec(mathematics,103,b,17,5) lec(mechanics,101,c,9,5) lec(physics,106,d,15,5)
Optimization: 8 520
Answer: 2
lec(electronics,101,a,9,1) lec(electronics,101,a,11,1) lec(programming,103,a,12,1) lec(programming,103,a,13,1) lec(dataStructures,101,b,10,1) lec(mathematics,103,b,15,1) lec(mechanics,101,c,17,1) lec(mechanics,101,c,18,1) lec(physics,102,d,9,1) lec(physics,102,d,10,1) lec(electronics,101,a,12,2) lec(programming,103,a,13,2) lec(dataStructures,101,b,11,2) lec(dataStructures,102,b,12,2) lec(mathematics,103,b,15,2) lec(mathematics,103,b,16,2) lec(mechanics,101,c,17,2) lec(mechanics,101,c,18,2) lec(physics,102,d,9,2) lec(physics,102,d,10,2) lec(mathematics,103,b,12,3) lec(mathematics,103,b,13,3) lec(mechanics,101,c,17,3) lec(mechanics,101,c,18,3) lec(physics,102,d,9,3) lec(physics,102,d,10,3) lec(electronics,101,a,9,4) lec(electronics,101,a,11,4) lec(programming,103,a,10,4) lec(programming,103,a,12,4) lec(dataStructures,101,b,13,4) lec(dataStructures,101,b,14,4) lec(electronics,101,a,10,5) lec(electronics,101,a,11,5) lec(programming,103,a,12,5) lec(programming,103,a,13,5) lec(dataStructures,101,b,14,5) lec(dataStructures,101,b,15,5) lec(mathematics,103,b,16,5) lec(mathematics,103,b,17,5) lec(mechanics,101,c,9,5) lec(physics,106,d,15,5)
Optimization: 8 512
Answer: 3
lec(electronics,101,a,9,1) lec(electronics,101,a,11,1) lec(programming,103,a,12,1) lec(programming,103,a,13,1) lec(dataStructures,101,b,10,1) lec(mathematics,103,b,15,1) lec(mechanics,101,c,17,1) lec(mechanics,101,c,18,1) lec(physics,102,d,9,1) lec(physics,102,d,10,1) lec(electronics,101,a,12,2) lec(programming,103,a,13,2) lec(dataStructures,101,b,9,2) lec(dataStructures,101,b,11,2) lec(mathematics,103,b,15,2) lec(mathematics,103,b,16,2) lec(mechanics,101,c,17,2) lec(mechanics,101,c,18,2) lec(physics,102,d,9,2) lec(physics,102,d,10,2) lec(mathematics,103,b,12,3) lec(mathematics,103,b,13,3) lec(mechanics,101,c,17,3) lec(mechanics,101,c,18,3) lec(physics,102,d,9,3) lec(physics,102,d,10,3) lec(electronics,101,a,9,4) lec(electronics,101,a,11,4) lec(programming,103,a,10,4) lec(programming,103,a,12,4) lec(dataStructures,101,b,13,4) lec(dataStructures,101,b,14,4) lec(electronics,101,a,10,5) lec(electronics,101,a,11,5) lec(programming,103,a,12,5) lec(programming,103,a,13,5) lec(dataStructures,101,b,14,5) lec(dataStructures,101,b,15,5) lec(mathematics,103,b,16,5) lec(mathematics,103,b,17,5) lec(mechanics,101,c,9,5) lec(physics,106,d,15,5)
Optimization: 8 504
Answer: 4
lec(electronics,101,a,9,1) lec(electronics,101,a,11,1) lec(programming,103,a,12,1) lec(programming,103,a,13,1) lec(dataStructures,101,b,10,1) lec(dataStructures,101,b,16,1) lec(mathematics,103,b,15,1) lec(mechanics,101,c,17,1) lec(mechanics,101,c,18,1) lec(physics,102,d,9,1) lec(physics,102,d,10,1) lec(electronics,101,a,9,2) lec(programming,103,a,13,2) lec(dataStructures,101,b,11,2) lec(mathematics,103,b,15,2) lec(mathematics,103,b,16,2) lec(mechanics,101,c,17,2) lec(mechanics,101,c,18,2) lec(physics,102,d,9,2) lec(physics,102,d,10,2) lec(mathematics,103,b,12,3) lec(mathematics,103,b,13,3) lec(mechanics,101,c,17,3) lec(mechanics,101,c,18,3) lec(physics,102,d,9,3) lec(physics,102,d,10,3) lec(electronics,101,a,9,4) lec(electronics,101,a,11,4) lec(programming,103,a,10,4) lec(programming,103,a,12,4) lec(dataStructures,101,b,13,4) lec(dataStructures,101,b,14,4) lec(electronics,101,a,10,5) lec(electronics,101,a,11,5) lec(programming,103,a,12,5) lec(programming,103,a,13,5) lec(dataStructures,101,b,14,5) lec(dataStructures,101,b,15,5) lec(mathematics,103,b,16,5) lec(mathematics,103,b,17,5) lec(mechanics,101,c,9,5) lec(physics,106,d,15,5)
Optimization: 8 496
Answer: 5
lec(electronics,101,a,12,1) lec(programming,103,a,9,1) lec(programming,103,a,11,1) lec(dataStructures,101,b,10,1) lec(dataStructures,101,b,13,1) lec(mathematics,103,b,14,1) lec(mathematics,103,b,15,1) lec(mechanics,101,c,16,1) lec(mechanics,101,c,17,1) lec(physics,102,d,12,1) lec(electronics,101,a,9,2) lec(electronics,101,a,12,2) lec(programming,103,a,10,2) lec(programming,103,a,13,2) lec(dataStructures,101,b,11,2) lec(dataStructures,101,b,14,2) lec(mathematics,103,b,16,2) lec(mechanics,101,c,17,2) lec(mechanics,101,c,18,2) lec(physics,102,d,9,2) lec(physics,102,d,12,2) lec(electronics,103,a,12,3) lec(mathematics,103,b,14,3) lec(mathematics,103,b,15,3) lec(mechanics,101,c,16,3) lec(mechanics,101,c,17,3) lec(physics,101,d,12,3) lec(electronics,102,a,12,4) lec(programming,103,a,11,4) lec(dataStructures,106,b,16,4) lec(physics,101,d,12,4) lec(electronics,101,a,10,5) lec(electronics,102,a,12,5) lec(programming,103,a,9,5) lec(programming,103,a,11,5) lec(dataStructures,101,b,13,5) lec(dataStructures,101,b,15,5) lec(mathematics,103,b,16,5) lec(mathematics,103,b,17,5) lec(mechanics,101,c,18,5) lec(physics,101,d,14,5) lec(physics,106,d,12,5)
Optimization: 7 513
Answer: 6
lec(electronics,101,a,9,1) lec(electronics,101,a,12,1) lec(programming,103,a,11,1) lec(programming,103,a,14,1) lec(dataStructures,101,b,13,1) lec(dataStructures,101,b,15,1) lec(mathematics,103,b,10,1) lec(mathematics,103,b,17,1) lec(mechanics,101,c,16,1) lec(mechanics,101,c,18,1) lec(physics,102,d,12,1) lec(physics,102,d,13,1) lec(electronics,101,a,9,2) lec(electronics,101,a,10,2) lec(programming,103,a,13,2) lec(programming,103,a,15,2) lec(dataStructures,101,b,11,2) lec(dataStructures,101,b,14,2) lec(mathematics,103,b,16,2) lec(mathematics,103,b,17,2) lec(mechanics,101,c,18,2) lec(mechanics,102,c,9,2) lec(physics,102,d,10,2) lec(physics,102,d,12,2) lec(electronics,101,a,9,3) lec(programming,103,a,10,3) lec(programming,103,a,11,3) lec(dataStructures,101,b,13,3) lec(mathematics,103,b,14,3) lec(mathematics,103,b,15,3) lec(mechanics,101,c,16,3) lec(mechanics,101,c,17,3) lec(physics,101,d,12,3) lec(programming,103,a,9,4) lec(mathematics,103,b,10,4) lec(mechanics,101,c,11,4) lec(physics,103,d,12,4) lec(electronics,101,a,10,5) lec(electronics,102,a,12,5) lec(dataStructures,101,b,13,5) lec(dataStructures,101,b,15,5) lec(physics,106,d,12,5)
Optimization: 7 505
Answer: 7
lec(electronics,101,a,9,1) lec(electronics,101,a,11,1) lec(programming,103,a,12,1) lec(programming,103,a,13,1) lec(dataStructures,101,b,10,1) lec(dataStructures,101,b,14,1) lec(mathematics,103,b,15,1) lec(mathematics,103,b,17,1) lec(mechanics,101,c,16,1) lec(mechanics,101,c,18,1) lec(physics,102,d,9,1) lec(physics,102,d,10,1) lec(electronics,101,a,9,2) lec(electronics,101,a,10,2) lec(programming,103,a,13,2) lec(programming,103,a,14,2) lec(dataStructures,101,b,15,2) lec(mathematics,103,b,11,2) lec(mechanics,101,c,17,2) lec(mechanics,101,c,18,2) lec(physics,101,d,12,2) lec(physics,101,d,16,2) lec(programming,103,a,12,3) lec(mathematics,103,b,16,3) lec(mathematics,103,b,17,3) lec(mechanics,101,c,18,3) lec(electronics,101,a,9,4) lec(electronics,101,a,10,4) lec(programming,103,a,11,4) lec(programming,103,a,12,4) lec(dataStructures,101,b,13,4) lec(dataStructures,101,b,14,4) lec(mathematics,103,b,15,4) lec(mathematics,103,b,17,4) lec(mechanics,102,c,9,4) lec(mechanics,102,c,13,4) lec(physics,101,d,16,4) lec(physics,101,d,18,4) lec(electronics,102,a,12,5) lec(dataStructures,101,b,12,5) lec(dataStructures,101,b,15,5) lec(physics,106,d,12,5)
Optimization: 7 497
Answer: 8
lec(electronics,101,a,9,1) lec(electronics,101,a,11,1) lec(programming,103,a,12,1) lec(programming,103,a,13,1) lec(dataStructures,101,b,10,1) lec(dataStructures,101,b,14,1) lec(mathematics,103,b,15,1) lec(mathematics,103,b,17,1) lec(mechanics,101,c,16,1) lec(mechanics,101,c,18,1) lec(physics,102,d,9,1) lec(physics,102,d,10,1) lec(electronics,101,a,9,2) lec(programming,103,a,10,2) lec(programming,103,a,13,2) lec(dataStructures,101,b,15,2) lec(mathematics,103,b,11,2) lec(mechanics,101,c,17,2) lec(mechanics,101,c,18,2) lec(physics,101,d,14,2) lec(physics,101,d,16,2) lec(programming,103,a,12,3) lec(mathematics,103,b,16,3) lec(mathematics,103,b,17,3) lec(mechanics,101,c,18,3) lec(electronics,101,a,9,4) lec(electronics,101,a,10,4) lec(programming,103,a,11,4) lec(programming,103,a,12,4) lec(dataStructures,101,b,13,4) lec(dataStructures,101,b,14,4) lec(mathematics,103,b,15,4) lec(mathematics,103,b,17,4) lec(mechanics,102,c,9,4) lec(mechanics,102,c,13,4) lec(physics,101,d,16,4) lec(physics,101,d,18,4) lec(electronics,101,a,11,5) lec(electronics,103,a,12,5) lec(dataStructures,101,b,15,5) lec(dataStructures,102,b,12,5) lec(physics,106,d,12,5)
Optimization: 7 496
OPTIMUM FOUND

Models       : 1
  Enumerated : 8
  Optimum    : yes
Optimization : 7 496
Calls        : 1
Time         : 3.737s (Solving: 2.04s 1st Model: 0.44s Unsat: 1.08s)
CPU Time     : 3.720s
*%
