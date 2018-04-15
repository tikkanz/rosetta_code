Note 'Ramer-Douglas-Peucker line simplification'
https://rosettacode.org/wiki/Ramer-Douglas-Peucker_line_simplification#J
)

Points=: 0 0 , 1 0.1 , 2 _0.1 , 3 5 , 4 6 , 5 7 , 6 8.1 , 7 9 , 8 9 ,: 9 9
Threshold=: 1.0

perpDist=: verb define
  'start end point'=. 0 0 , 9 9 ,: 1 0.1
  dxdy=. end - start
  NB. normalise
  mag=. +/&.:*: dxdy
  if. mag > 0 do. dxdy=. dxdy % mag end.
  NB. Get dot product (project pv onto normalized direction)
  pvxy=. point - start
  pvdot=. dxdy +/@:* pvxy

  NB. Scale line direction vector and substract it from pv
  axy=. pvxy - pvdot * dxdy
  +/&.:*: axy
)

perpDist=: verb define
  points=. y
  dxdy=. ({: - {.) points
  NB. normalise
  mag=. hypot dxdy
  dxdy=. dxdy % (mag , 1) {~ mag = 0
  NB. Get dot product (project pv onto normalized direction)
  pvxy=. (-"1 {.) points
  pvdot=. dxdy +/@:*"1 pvxy

  NB. Scale line direction vector and substract it from pv
  hypot"1 pvxy -"1 pvdot */ dxdy
)

perpDist=: verb define
  points=. y
  dxdy=. normalize@({: - {.)

  NB. Get dot product (project pv onto normalized direction)
  pvxy=. -"1 {.
  pvdot=. dxdy +/@:*"1 pvxy

  NB. Scale line direction vector and substract it from pv
  hypot"1@(pvxy -"1 pvdot */ dxdy) points
)

mp=: +/ .*
norm=: +/&.:*:  NB. vecnorm
normalize=: (% norm)^:(0 < norm)

dxy=. normalize@({: - {.)
pv=. -"1 {.
pvdot=. dxy mp"1 pv
perpDist0=: norm"1@(pv -"1 pvdot */ dxy) f.
perpDist1=: norm"1@(pv -"1 dxy (mp"1 */ [) pv) f.
perpDist2=: norm"1@(dxy (] -"1 mp"1 */ [) pv) f.
perpDist3=: norm"1@(pv ([ -"1 mp"1~ */ ]) dxy) f.

perpDist=: perpDist3

rdp=: verb define
  1 rdp y
  :
  points=. y
  epsilon=. x
  if. 2 > # points do. points return. end.

  NB. point with the maximum distance from line between start and end
  'dmax imax'=. (>./ , ] i. >./) perpDist points
  if. dmax > epsilon do.
    recrst1=. epsilon }:@rdp (1+imax) {. points
    recrst2=. epsilon rdp imax }. points
    out=. recrst1 , recrst2
  else.
    out=. ({. ,: {:) points
  end.
  out
)


Note 'Pseudo code from Wikipedia'
function DouglasPeucker(PointList[], epsilon)
    // Find the point with the maximum distance
    dmax = 0
    index = 0
    end = length(PointList)
    for i = 2 to ( end - 1) {
        d = perpendicularDistance(PointList[i], Line(PointList[1], PointList[end]))
        if ( d > dmax ) {
            index = i
            dmax = d
        }
    }

    // If max distance is greater than epsilon, recursively simplify
    if ( dmax > epsilon ) {
        // Recursive call
        recResults1[] = DouglasPeucker(PointList[1...index], epsilon)
        recResults2[] = DouglasPeucker(PointList[index...end], epsilon)

        // Build the result list
        ResultList[] = {recResults1[1...length(recResults1)-1], recResults2[1...length(recResults2)]}
    } else {
        ResultList[] = {PointList[1], PointList[end]}
    }
    // Return the result
    return ResultList[]
end
)
