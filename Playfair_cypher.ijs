Note 'Playfair cypher'
https://rosettacode.org/wiki/Playfair_cypher#J
)

choose=: verb define
  sel=. 'Q' e. y
  alph=: (sel { 'JQ') -.~ a. {~ 65 + i.26
  norm=: [: dedouble alph restrict ('I' I.@:=&'J'@]} ])`(-.&'Q')@.sel@toupper
  ''
)

restrict=: ] -. -.~
dedouble=: verb define
  while. +./ msk=. =/"1 ] _2 ]\ y do.
    y =. (1 2 p. I. msk) ({. , 'X' , }.) y
  end.
  y
)

choose 'Q'
 
 
setkey=: verb define
  key=. ~.norm y,alph
  ref=: ,/ 2{."1 ~."1 (,"0/~ alph) ,"1 norm 'XQV'
  mode=. #. =/"2 inds=. 5 5#:key i. ref
  inds0=. (0 3,:2 1)&{@,"2 inds
  inds1=. 5|1 0 +"1 inds NB. same column
  inds2=. 5|0 1 +"1 inds NB. same row
  alt=: key {~ 5 #. mode {"_1 inds0 ,"2 3 inds1 ,:"2 inds2
  i. 0 0
)
 
pairs=: verb define 
  2{."1 -.&' '"1 ~."1 (_2]\ norm y) ,"1 'XQV'
)
 
encrypt=: verb define
  ;:inv ;/ alt{~ref i. pairs y
)
 
decrypt=: verb define
  ;:inv ;/ ref{~alt i. pairs y
)

Note 'Required Example'
   choose 'IJ'

   setkey 'playfair example'
   encrypt 'Hide the gold in the tree stump'
BM OD ZB XD NA BE KU DM UI XM MO UV IF
   decrypt 'BM OD ZB XD NA BE KU DM UI XM MO UV IF'
HI DE TH EG OL DI NT HE TR EX ES TU MP
)