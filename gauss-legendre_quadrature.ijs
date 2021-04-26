Note 'Gauss-Legendre_Quadrature'
https://rosettacode.org/wiki/Numerical_integration/Gauss-Legendre_Quadrature#J
)

NB. returns coefficents for yth-order Legendre polynomial
getLegendreCoeffs=: verb define M.
  if. y<:1 do. 1 {.~ - y+1 return. end.
  (%~ <:@(,~ +:) -/@:* (0;'') ,&> [: getLegendreCoeffs&.> -&1 2) y
)

getPolyRoots=: 1 {:: p.                                NB. returns the roots of a polynomial
getGaussLegendreWeights=: 2 % -.@*:@[ * (*:@p.~ p..)   NB. form: roots getGaussLegendreWeights coeffs
getGaussLegendrePoints=: (getPolyRoots ([ ,: getGaussLegendreWeights) ])@getLegendreCoeffs

NB.*integrateGaussLegendre a Integrates a function u with a n-point Gauss-Legendre quadrature rule over the interval [a,b]
NB. form: npoints function integrateGaussLegendre (a,b)
integrateGaussLegendre=: adverb define
:
  'nodes wgts'=. getGaussLegendrePoints x
  -: (-~/ y) * wgts +/@:* u -: nodes p.~ (+/ , -~/) y
)

Note 'Example Use:'
   5 ^ integrateGaussLegendre _3 3
   -~/ ^ _3 3    NB. true value
)


Note 'old version using Direct Definition'

P=: {{
  if. y<:1 do. 1 {.~ - y+1 return. end.
  (%~ <:@(,~ +:) -/@:* (0;'') ,&> [: P&.> -&1 2) y
}} M.

getpoints=: {{)m  NB. returns points,:weights for y points 
  roots=. 1{:: p. coeffs=. P y
  wgts=. roots (2 % -.@*:@[ * (*:@p.~ p..)) coeffs
  roots,:wgts
}}

GaussLegendre=: {{  NB. npoints function GaussLegendre (a,b)
  'pts wgts'=. getpoints x
  -: (-~/ y) * +/ wgts * u -: ((+/ , -~/) y) p. pts
}}

)
