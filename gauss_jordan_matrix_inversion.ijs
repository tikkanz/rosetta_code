Note 'Gauss-Jordan matrix inversion'
https://rosettacode.org/wiki/Gauss-Jordan_matrix_inversion#J
)

Note 'Solution'
Uses Gauss-Jordan implementation (as described in Reduced_row_echelon_form#J) to find 
reduced row echelon form of the matrix after augmenting with an identity matrix. 
)

require 'math/misc/linear'
augmentR_I1=: ,. =@i.@#
augmentR_I1=: ,. idmat@#
matrix_invGJ=: # }."1 gauss_jordan@augmentR_I1

NB. Usage

A =: 1 2 3, 4 1 6,: 7 8 9
B=: 2 _1 0 , _1 2 _1 ,: 0 _1 2

matrix_invGJ A
matrix_invGJ B