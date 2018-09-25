Note 'Law of cosines - triples'
http://rosettacode.org/wiki/Law_of_cosines_-_triples#J
)

load 'trig stats'

is90=: =&:(+/@:*:)
is60=: *:@[ = (+/@:*: - */)@]
is120=: *:@[ = (+/@:*: + */)@]



isCosineLaw=: ([ LHS }:@]) = RHS@{:@]   NB. A^2 + B^2 - 2ABcos(gamma) = C^2

isCosineLaw=: adverb define
  ((+/@:*: - 2 * cos@rfd@m * */)@}: = *:@{:)  NB. A^2 + B^2 - 2ABcos(gamma) = C^2
)

isCosineLaw=: adverb define
  ((+/@:*: - 2 * cos@rfd@m * */)@}: = *:@{:)      NB. A^2 + B^2 - 2ABcos(gamma) = C^2
)

sumsq=: +/@:*:
prod=: */



Note 'Solve problem'
  (#~ 60 isCosineLaw"1)   ,/(>: i.13) ,.~"0 _ >: 2 combrep 13
  (#~ 90 isCosineLaw"1)   ,/(>: i.13) ,.~"0 _ >: 2 combrep 13
  (#~ 120 isCosineLaw"1)   ,/(>: i.13) ,.~"0 _ >: 2 combrep 13
  NB. extra credit
  (#~ 60 isCosineLaw"1) (_3 ]\ 3 # >: i.13) -.~  ,/(>: i.13) ,.~"0 _ >: 2 combrep 13
)


RHS=: *:            NB. right-hand-side of Cosine Law
LHS=: +/@:*:@] - cos@rfd@[ * 2 * */@]  NB. Left-hand-side of Cosine Law

solve=: 4 :0
  adjsides=. >: 2 combrep y
  oppside=. >: i. y
  idx=. (RHS oppside) i. x LHS"1 adjsides
  adjsides ((#~ idx ~: #) ,. ({~ idx -. #)@]) oppside
)

solvextra=: solve -. _3 ]\ 3 # >:@i.@]

Note 'Examples'
60 90 120 solve&.> 13
60 #@(solve -. _3 ]\ 3 # >:@i.@]) 10000
)
