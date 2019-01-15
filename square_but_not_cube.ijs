Note 'Square but not cube'
http://rosettacode.org/wiki/Square_but_not_cube#J
)

isSqrNotCube=: [: *./ 0 1 |@:- [: (= <.) 2 3 %:/ ]
getN_Indicies=: adverb def '[ getIdx [ (] , [: u (i.200) + #@])^:notEnough^:_ u@]'

Note 'Example Usage:'
   I. isSqrNotCube i.1090      NB. If we know the upper limit required to get first 30
4 9 16 25 36 49 81 100 121 144 169 196 225 256 289 324 361 400 441 484 529 576 625 676 784 841 900 961 1024 1089
   30 isSqrNotCube getFirst 0  NB. otherwise to iteratively build list until first 30 found
4 9 16 25 36 49 81 100 121 144 169 196 225 256 289 324 361 400 441 484 529 576 625 676 784 841 900 961 1024 1089
)

isInt=: = <.           NB. are numbers integers
sqrcube=: 2 3 %:/ ]    NB. table of 2nd and 3rd roots of y
isSqrNotCube=: [: *./ 0 1 |@:- [: isInt sqrcube  NB. is y a squared but not a cubed integer
getFirst=: (<. #) {. ] NB. get first up to x items from y
getIdx=: getFirst I.   NB. get indicies of first up to x ones in boolean y

process_more=: adverb def '] , [: u (i.200) + #@]'  NB. process the next 200 indicies with u and append to y
notEnough=: > +/       NB. is left arg greater than sum of right arg
while=: conjunction def 'u^:v^:_'     NB. repeat u while v is true

process_until_enough=: adverb def 'u process_more while notEnough u'

Note 'testing'
30 getIdx isSqrNotCube i.1090
30 (isSqrNotCube process_more while notEnough) 0
30 ([ getIdx isSqrNotCube process_more while notEnough) 0
30 ([ getIdx [ isSqrNotCube process_more while notEnough isSqrNotCube@]) 0
30 isSqrNotCube process_until_enough 0
30 ([ getIdx isSqrNotCube process_until_enough) 0
)
