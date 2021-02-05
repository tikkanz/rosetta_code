Note 'Find the intersection of two lines'
https://rosettacode.org/wiki/Find_the_intersection_of_two_lines#J
)

det=: -/ .*   NB. calculate determinant
findIntersection=: (det ,."1 [: |: -/"2) %&det -/"2

Note 'Examples'
line1=: 4 0 ,: 6 10
line2=: 0 3 ,: 10 7
line3=: 0 3 ,: 10 7.1
line4=: 0 0 ,: 1 1
line5=: 1 2 ,: 4 5
line6=: 1 _1 ,: 4 4
line7=: 2 5 ,: 3 _2

findIntersection line1 ,: line2
findIntersection line4 ,: line5
findIntersection line6 ,: line7
)