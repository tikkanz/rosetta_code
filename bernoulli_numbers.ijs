Note 'Bernoulli Numbers'
https://rosettacode.org/wiki/Bernoulli_numbers#J
)

NB.*B v calculates the yth Bernoulli number
Bn=: verb define"0
  +/,(<: * (_1 ^ [) * ! * (y ^~ 1 + [) % 1 + ])"0/~ i. 1x+y
)

Note 'Task'
'B',.rplc&'r/_-'"1": (#~ 0 ~: {:"1)(,.Bn) i.61
)

Note 'Using defs from Essay on J Wiki'
https://code.jsoftware.com/wiki/Essays/Bernoulli_Numbers
)

NB. Calculate the first y Bernoulli numbers

B=: 3 : 0
  b=. 1 _1r2
  for_m. 2x*}.i.>.-:y do.
    b=. b,0,~(1+m)%~-+/b*(i.m)!1+m
  end.
  }:^:(2|y) b
)


B=: {.&1 %. (i. ! ])@>:@i.@x:

NB. use B1 to return yth Bernoulli number
Bn=: {:@B@>:

Note 'Task'
'B' ,. rplc&'r/_-'"1": (#~ 0 ~: {:"1)(i. ,. B) 61
)
