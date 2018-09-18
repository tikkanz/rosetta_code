Note 'Find the intersection of two lines'
http://rosettacode.org/wiki/Find_the_intersection_of_two_lines#J
)

lines=: noun define
4 0 6 10
0 3 10 7
0 3 10 7.1
0 0 1 1
1 2 4 5
1 _1 4 4
2 5 3 _2
)

'line1 line2 line3 line4 line5 line6 line7'=: _2 ]\"1 ] 0 ". ];._2  lines

det=: -/ .*
coeffLine=: -/ , det   NB. gets coefficents A, B & C (i.e. Ax + By = C) from a line defined by start and end points ((x,y) ,: (x,y))
coeffLine=: 3 :0
's e'=. y
A=. {:s - e
B=. {.e - s
C=. (A * {.s) + B * ({:s)
)

coeffLine=: 3 :0
'B A'=. 1 _1 * -/ y
C=. +/ (A,B) * {.y
A,B,C
)

coeffLine=: 3 :0
AB=. |.@(1 _1 * -/) y
C=. ({. +/@:* |.@(1 _1 * -/))y
AB,C
)

coeffLine=: |.@(1 _1 * -/) , ({. +/@:* |.@(1 _1 * -/))
coeffLine=: |.@(1 _1 * -/) , det

intersectLinesb=: verb define
  'l1 l2'=. y
  a1=. -~/ {:"1 l1
  b1=. -/ {."1 l1
  c1=. +/ (a1,b1) * {. l1

  a2=. -~/ {:"1 l2
  b2=. -/ {."1 l2
  c2=. +/ (a2,b2) * {. l2
  d=. det (a1 , a2) ,: (b1 , b2)
  (d %~ (c1,b1) -/@:* b2,c2),(d %~ (a1,c1) -/@:* c2,a2)
)

intersectLinesb=: verb define
  'l1 l2'=. y
  'a1 b1 c1'=. coeffLine l1
  'a2 b2 c2'=. coeffLine l2
  d=. det (a1 , a2) ,: (b1 , b2)
  d=. det -/"2 l1 ,: l2
  (d %~ (c1,b1) -/@:* b2,c2),(d %~ (a1,c1) -/@:* c2,a2)
)

intersectLines=: verb define
  lines=. y
  numerators=. det (det lines) ,."1 |: -/"2 lines
  denominator=. det -/"2 lines
  numerators % denominator
)

findIntersection=: [: %/"1 det@((det ,."1 [: |: -/"2) ,:"2 -/"2)
findIntersection=: (det ,."1 [: |: -/"2) %&det -/"2

intersectLines line1 ,: line2
intersectLines line1 ,: line3
intersectLines line4 ,: line5
intersectLines line6 ,: line7
findIntersection line1 ,: line2
findIntersection line1 ,: line3
findIntersection line4 ,: line5
findIntersection line6 ,: line7