
l1=: 1 _1 ,: 4 4
l2=: 2 5 ,: 3 _2

l1=: 4 0 ,: 6 10
l2=: 0 3 ,: 10 7

-/ l1

coeffLine=: -/ , +/@({."1 * -/)   NB. gets coefficents A, B & C from a line defined by a start and end point


det=: -/ .*

intersectLines=: verb define
'l1 l2'=. y
a1=. -~/ {:"1 l1
b1=. -/ {."1 l1
c1=. +/ (a1,b1) * {. l1

a2=. -~/ {:"1 l2
b2=. -/ {."1 l2
c2=. +/ (a2,b2) * {. l2
d=. det (a1 , a2) ,: (b1 , b2)
(d %~ (b2 * c1) - b1 * c2),(d %~ (a1 * c2) - a2 * c1)
)
