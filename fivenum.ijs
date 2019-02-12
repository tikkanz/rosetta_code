Note 'Fivenum'
https://rosettacode.org/wiki/Fivenum#J
)

midpts=: (1 + #) <:@(] , -:@[ , -) -:@<.@-:@(3 + #) NB. mid points of y
quartiles=: -:@(+/)@((<. ,: >.)@midpts { /:~@])  NB. quartiles of y
fivenum=: <./ , quartiles , >./                  NB. fivenum summary of y

test1=: 15 6 42 41 7 36 49 40 39 47 43
test2=: 36 40 7 39 41 15
test3=: , 0 ". ];._2 noun define
 0.14082834  0.09748790  1.73131507  0.87636009 -1.95059594
 0.73438555 -0.03035726  1.46675970 -0.74621349 -0.72588772
 0.63905160  0.61501527 -0.98983780 -1.00447874 -0.62759469
 0.66206163  1.04312009 -0.10305385  0.75775634  0.32566578
)

fivenum &> test1;test2;test3



Note 'other approaches'

http://www.jsoftware.com/pipermail/programming/2009-October/016618.html
midpts=: (%~ i.&.<:)@[ * <:@#@]               NB. returns x-1 mid-indicies from y
ntiles=: -:@(+/)@((<. ,: >.)@midpts { /:~@])  NB. returns the x-tiles from y

http://www.jsoftware.com/pipermail/programming/2009-October/016612.html
quartiles0=: -:@(+/)@({~ (,: <:)@(0.25 0.5 0.75 >.@:* #))@/:~
NB. Simplified version of Keith's
quartiles1=: median (([: median ] #~ >) , [ , [: median ] #~ <) ]
NB. A slightly different approach:
quartiles2=: /:~@(median ([ , > median/. ]) ])

NB. Julia docs
  ((k-1)/(n-1), v[k]), for k = 1:n where n = length(itr).  
NB. R implementation
  n4 <- floor((n + 3)/2)/2
  d <- c(1, n4, (n + 1)/2, n + 1 - n4, n)
  quartiles=: ([: -:@:<. 3 -:@+ #) , (1 -:@+ #) , (([: -:@:<. 3 -:@+ #) -~ 1 + #)
  quartiles=: ([: -:@:<. 3 -:@+ #) ([ , -:@] , -~) (1 + #@])
  quartiles=: (1 + #) (] , -:@[ , -) ([: -:@<. 3 -:@+ #)
)

