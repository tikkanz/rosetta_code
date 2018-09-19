NB. Solution:

mp=: +/ . *  NB. matrix product
h =: +@|:    NB. conjugate transpose
 
cholesky=: 3 : 0
 n=. #A=. y
 if. 1>:n do.
  assert. (A=|A)>0=A  NB. check for positive definite
  %:A
 else.
  'X Y t Z'=. , (;~n$(>.-:n){.1) <;.1 A
  L0=. cholesky X
  L1=. cholesky Z-(T=.(h Y) mp %.X) mp Y
  L0,(T mp L0),.L1
 end.
)

Note 'Examples'
   eg1=: 25 15 _5 , 15 18 0 ,: _5 0 11
   eg2=: 18 22 54 42 , 22 70 86 62 , 54 86 174 134 ,: 42 62 134 106
   cholesky eg1
   cholesky eg2
)

NB. Using math/lapack addon
   load 'math/lapack'
   load 'math/lapack/potrf'
   potrf_jlapack_ eg1
   potrf_jlapack_ eg2
