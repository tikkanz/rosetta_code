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

Line=: 0 0 10 ,: 0 _1 _1   NB. Point, ray
Plane=: 0 0 5 ,: 0 0 1     NB. Point, normal

Line intersectLinePlane Plane


NB. Add osme other examples?
NB. convert line/plane representations
points2pointray=: {. ,: -~/
pointray2points=: {. ,: +/

points2pointnormal=: {. ,: }. *@- {.

LineA=: 1 0 1 ,: 4 _2 2     NB. point 1, point 2
PlaneA=: 1 1 1 ,: 6 6 6    NB. x + y + z = 6
PlaneA=: 1 4 _2 , 2 7 3 ,: _3 5 2 NB. points
PlaneA=: x y z ,: a b c   NB. ax + by + cz = d
IntersectA=: 7 _4 3

