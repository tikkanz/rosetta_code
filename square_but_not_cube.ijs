Note 'Square but not cube'
http://rosettacode.org/wiki/Square_but_not_cube#J
)

isSqrNotCubeofInt=: (*. -.)/@(= <.)@(2 3 %:/ ])
getN_Indicies=: adverb def '[ ({. I.) [ (] , [: u (i.200) + #@])^:(> +/)^:_ u@]'

Note 'Example Usage:'
   I. isSqrNotCubeofInt i.1090      NB. If we know the upper limit required to get first 30
4 9 16 25 36 49 81 100 121 144 169 196 225 256 289 324 361 400 441 484 529 576 625 676 784 841 900 961 1024 1089
   30 isSqrNotCubeofInt getN_Indicies 0  NB. otherwise iteratively build list until first 30 found
4 9 16 25 36 49 81 100 121 144 169 196 225 256 289 324 361 400 441 484 529 576 625 676 784 841 900 961 1024 1089
)

NB. Alternative more "friendly" component-based solution
isInt=: = <.                                     NB. are numbers integers
sqrcube=: 2 3 %:/ ]                              NB. table of 2nd and 3rd roots of y
isSqrNotCubeofInt=: (*. -.)/@isInt@sqrcube       NB. is y the square but not cube of an integer
getFirst=: ($:~ #) : ((<. #) {. ])               NB. get first up to x items from y
getIdx=: getFirst@I. : (getFirst I.)             NB. get indicies of first up to x ones in boolean y

process_more=: adverb def '] , [: u (i.200) + #@]'  NB. process the next 200 indicies with u and append to y
notEnough=: > +/                                 NB. is left arg greater than sum of right arg
while=: conjunction def 'u^:v^:_'                NB. repeat u while v is true

process_until_enough=: adverb def 'u process_more while notEnough u'

Note 'testing'
30 getIdx isSqrNotCubeofInt i.1090
30 (isSqrNotCubeofInt process_more while notEnough) 0
30 ([ getIdx isSqrNotCubeofInt process_more while notEnough) 0
30 ([ getIdx [ isSqrNotCubeofInt process_more while notEnough isSqrNotCubeofInt@]) 0
30 isSqrNotCubeofInt process_until_enough 0
30 ([ getIdx isSqrNotCubeofInt process_until_enough) 0
)
