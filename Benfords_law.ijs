Note 'Benfords law'
https://rosettacode.org/wiki/Benford%27s_law#J
)

benford=: 10&^.@(1 + %)                  NB. expected frequency of 1-9 as first digit
Digits=: '123456789'
firstSigDigits=: {.@(-. -.&Digits)@":"0  NB. extract first significant digit from numbers

freq=: (] % +/)@:<:@(#/.~)@,             NB. calc frequency of values (x) in y

Note 'Required Examples'
]First1000Fib=: (, +/@:(_2&{.)) ^: (1000-#) 1 1
Digits
Digits freq firstSigDigits First1000Fib
benford "."0 Digits
NB. Expected vs Actual frequencies for Digits 1-9
("."0 Digits) ,. (benford "."0 Digits) ,. (Digits freq firstSigDigits First1000Fib)
Digits ((] ,. benford)@"."0@[ ,. (freq firstSigDigits)) First1000Fib
)