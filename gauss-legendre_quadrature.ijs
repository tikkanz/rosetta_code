Note 'Gauss-Legendre_Quadrature'
https://rosettacode.org/wiki/Numerical_integration/Gauss-Legendre_Quadrature#J
)

P=: {{ NB. returns coefficents for yth Legendre polynomial
  if. y<:1 do. 1 {.~ - y+1 return. end.
  (%~ <:@(,~ +:) -/@:* (0;'') ,&> [: P&.> -&1 2) y
}}

getpoints=: {{ NB. returns points,:weights for y points 
  pts=. 1{:: p. coeffs=. P y
  wgts=. pts (2 % -.@*:@[ * (*:@p.~ p..)) coeffs
  pts,:wgts
}}

GaussLegendre=: {{ NB. npoints function GaussLegendre (a,b)
  'pts wgts'=. getpoints x
  -: (-~/ y) * +/ wgts * u -: ((+/ , -~/) y) p. pts
}}

Note 'Example Use:'
   5 ^ GaussLegendre _3 3
)
