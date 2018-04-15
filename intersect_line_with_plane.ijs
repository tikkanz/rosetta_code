Note 'Find intersection of line with plane'
http://rosettacode.org/wiki/Find_the_intersection_of_a_line_with_a_plane
)

intersectLinePlane=: dyad define
  'Lpoint Lray'=. x
  'Ppoint Pnormal'=. y
  cos=. Pnormal mp Lray NB. cosine between normal & ray
  if. cos = 0 do.
    return. 'Vectors are orthogonal; no intersection or line within plane'
  end.
  pdiff=. Lpoint - Ppoint          NB. difference between P0 and V0
  prod=. -(Pnormal mp pdiff) % cos NB. line segment where it intersects the plane
  Ppoint + pdiff + (prod * Lray)   NB. point where line intersects the plane
)

intersectLinePlane=: dyad define
  'Lpoint Lray'=. x
  'Ppoint Pnormal'=. y
  pdiff=. Lpoint - Ppoint
  prod1=. pdiff +/ .* Pnormal
  prod2=. Lray +/ .* Pnormal
  prod3=. prod1 % prod2
  Lpoint - Lray * prod3
)

mp=: +/ .*

prod1=. -&{. mp {:@]
prod2=. mp&{:
intLinePlane=: {.@[ - {:@[ * prod1 % prod2

p3=. mp&{: %~ -&{. mp {:@]
intLinePlane0=: {.@[ - {:@[ * p3 f.

d=: (-~&{. mp {:@]) % mp&{:
intLinePlane=: {.@[ + {:@[ * d 

d=: (-~&{. mp {:@]) % mp&{:
intLinePlane=: [ +/@:* 1 , d

Line0=: 0 0 10 ,: 0 _1 _1   NB. Point, ray
Plane0=: 0 0 5 ,: 0 0 1     NB. Point, normal
Intersect0=: 0 _5 5

Intersect0 -: Line0 intersectLinePlane Plane0


Plane1=: 3 3 3 ,: 1 2 3
Line1=: 0 2 4 ,: 3 2 1
Intersect1=: 0.6 2.4 4.2

Intersect! -: Line1 intersectLinePlane Plane1

NB. Add osme other examples?
NB. convert line/plane representations
points2pointray=: {. ,: -~/
pointray2points=: {. ,: +/

points2pointnormal=: {. ,: }. *@- {.

Line2=: 1 0 1 ,: 4 _2 2     NB. point 1, point 2
NB. Plane2=: 1 1 1 ,: 6 6 6    NB. x + y + z = 6
Plane2=: 1 4 _2 , 2 7 3 ,: _3 5 2 NB. points
NB. Plane2=: x y z ,: a b c   NB. ax + by + cz = d
Intersect2=: 7 _4 3

