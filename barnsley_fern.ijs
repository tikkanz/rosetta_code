Note 'Barnsley fern'
https://rosettacode.org/wiki/Barnsley_fern#J
)

require 'plot'
 
f=: |: 0 ". ];._2 noun define
  0     0     0    0.16   0 0      0.01
  0.85 -0.04  0.04 0.85   0 1.60   0.85
  0.20  0.23 -0.26 0.22   0 1.60   0.07
 -0.15  0.26  0.28 0.24   0 0.44   0.07
)
 
fm=: {&(|: 2 2 $ f)
fa=: {&(|: 4 5 { f)
prob=: (+/\ 6 { f) I. ?@0:
 
ifs=: (fa@] + fm@] +/ .* [) prob
getPoints=: ifs^:(<200000)
plotFern=: 'dot;grids 0 0;tics 0 0;labels 0 0;color green' plot ;/@|:
 
Note 'Usage:'
   plotFern getPoints 0 0
)
