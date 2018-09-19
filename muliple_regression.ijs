Note 'Multiple regression'
http://rosettacode.org/wiki/Multiple_regression#J
)

   NB. Wikipedia data
   x=: 1.47 1.50 1.52 1.55 1.57 1.60 1.63 1.65 1.68 1.70 1.73 1.75 1.78 1.80 1.83
   y=: 52.21 53.12 54.48 55.84 57.20 58.57 59.93 61.29 63.11 64.47 66.28 68.10 69.92 72.19 74.46
   X=: x ^/ i.3    NB. create Design matrix with columns x, x^2, x^3
   y %. X          NB. calculate coefficients b1, b2 and b3 for 2nd degree polynomial


NB. Breaking it down
   X=: x ^/ i.3                  NB. form Design matrix
   X=: (x^0) ,. (x^1) ,. (x^2)   NB. equivalent of previous line
   4{.X                          NB. show first 4 rows of X

   NB. Where y is a set of observations and X is the design matrix
   NB. y %. X does matrix division and gives the regression coefficients
   y %. X

Note 'In other words'
beta=: y %. X is the equivalent of:
βhat = (X′X)^−1 X′y    NB. {\hat {\beta }=(X'X)^{-1}X'y}
)

NB. To confirm:
   mp=: +/ .*                    NB. matrix product
                                 NB. %.X is matrix inverse of X
                                 NB. |:X is transpose of X
 
   (%.(|:X) mp X) mp (|:X) mp y
128.814 _143.163 61.9606
   xpy=: mp~ |:                  NB. Or factoring out "X prime y" (monadically "X prime X")
   X (%.@:xpy@[ mp xpy) y
128.814 _143.163 61.9606

NB. LAPACK routines are also available via the Addon math/lapack
   load 'math/lapack'
   load 'math/lapack/gels'
   gels_jlapack_ X;y
128.813 _143.162 61.9603