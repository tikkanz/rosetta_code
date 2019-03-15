Note 'Chowla Numbers'
https://rosettacode.org/wiki/Chowla_numbers#J
)

divisors=: 1&, -.~ ,@(*/&>/)@((^ i.@>:)&.>/)@(__&q:)    NB. https://code.jsoftware.com/wiki/Essays/Divisors
divisors=: ~.@(}.@}:@#:@i.@(2&^)@# */ .(^~) ])@q:
chowla=: +/@divisors
chowla=: >: -~ >:@#.~/.~&.q:   NB. sum of factors - (n + 1)

intsbelow=: (2 }. i.)"0    NB. drop 0 and 1
countPrimesbelow=: +/@(0 = chowla)@intsbelow
findPerfectsbelow=: (#~ <: = chowla)@intsbelow
display=: [: > 'c9.0'&(8!:2)
Note 'Tasks'
(] ,. chowla) >: i. 37    NB. chowla numbers 1-37
countPrimesbelow 100 1000 10000 100000 1000000 10000000
findPerfectsbelow 35000000

display (,. countPrimesbelow) 100 1000 10000 100000 1000000
display (,. findPerfectsbelow) 35000000

)
