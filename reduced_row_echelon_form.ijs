Note 'Reduced Row echelon form'
https://rosettacode.org/wiki/Reduced_row_echelon_form#J

The reduced row echelon form of a matrix can be obtained using the `gauss_jordan` verb 
from the `linear.ijs` script (http://www.jsoftware.com/wsvn/addons/trunk/math/misc/linear.ijs), 
available as part of the `math/misc` addon. That verb and the verb pivot are shown below.
)

NB. Solution
NB.*pivot v Pivot at row, column
NB. form: (row,col) pivot M
pivot=: dyad define
  'r c'=. x
  col=. c{"1 y
  y - (col - r = i.#y) */ (r{y) % r{col
)

NB.*gauss_jordan v Gauss-Jordan elimination (full pivoting)
NB. y is: matrix
NB. x is: optional minimum tolerance, default 1e_15.
NB.   If a column below the current pivot has numbers of magnitude all
NB.   less then x, it is treated as all zeros.
NB. if used to compute matrix inverse, first stitch on the identity matrix
gauss_jordan=: verb define
  1e_15 gauss_jordan y
:
  mtx=. y
  'r c'=. $mtx
  rows=. i.r
  i=. j=. 0
  max=. i.>./
  while. (i<r) *. j<c do.
    k=. max col=. | i}. j{"1 mtx
    if. 0 < x-k{col do.           NB. if all col < tol, set to 0:
      mtx=. 0 (<(i}.rows);j) } mtx
    else.                         NB. otherwise sort and pivot:
      if. k do.
        mtx=. (<i,i+k) C. mtx
      end.
      mtx=. (i,j) pivot mtx
      i=. >:i
    end.
    j=. >:j
  end.
  mtx
)

NB. Usage
]A=: 1 2 _1 _4 , 2 3 _1 _11 ,: _2 0 _3 22
require 'math/misc/linear'
gauss_jordan A

NB. Additional examples

gauss_jordan 2 0 _1  0  0,1 0  0 _1  0,3 0  0 _2 _1,0 1  0  0 _2,:0 1 _1  0  0
gauss_jordan 1  2  3  4  3  1,2  4  6  2  6  2,3  6 18  9  9 _6,4  8 12 10 12  4,:5 10 24 11 15 _4
gauss_jordan 0 1,1 2,:0 5

mat=: 0 ". ];._2 noun define
 1  0  0  0  0  0  1  0  0  0  0 _1  0  0  0  0  0  0
 1  0  0  0  0  0  0  1  0  0  0  0 _1  0  0  0  0  0
 1  0  0  0  0  0  0  0  1  0  0  0  0 _1  0  0  0  0
 0  1  0  0  0  0  1  0  0  0  0  0  0  0 _1  0  0  0
 0  1  0  0  0  0  0  0  1  0  0 _1  0  0  0  0  0  0
 0  1  0  0  0  0  0  0  0  0  1  0  0  0  0  0 _1  0
 0  0  1  0  0  0  1  0  0  0  0  0 _1  0  0  0  0  0
 0  0  1  0  0  0  0  0  0  1  0  0  0  0 _1  0  0  0
 0  0  0  1  0  0  0  1  0  0  0  0  0  0  0 _1  0  0
 0  0  0  1  0  0  0  0  0  1  0  0 _1  0  0  0  0  0
 0  0  0  0  1  0  0  1  0  0  0  0  0 _1  0  0  0  0
 0  0  0  0  1  0  0  0  1  0  0  0  0  0  0  0 _1  0
 0  0  0  0  1  0  0  0  0  0  1  0  0  0  0 _1  0  0
 0  0  0  0  0  1  0  0  0  0  0  0  0  0  0  0  0  0
 0  0  0  0  0  0  0  0  0  1  0  0  0  0  0  0  0  0
 0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  1  0  1
 0  0  0  0  0  1  0  0  0  0  1  0  0  0 _1  0  0  0
)
gauss_jordan mat