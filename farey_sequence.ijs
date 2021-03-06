Note 'Farey sequence'
https://rosettacode.org/wiki/Farey_sequence#J
)

Note 'previous implementations and tacit equivalents'
Farey_rdm=: {{ 0, /:~ ~. (#~ <:&1) , %/~ 1x + i.y }}
FareyT_rdm=: x:@/:~@(0 , ~.)@(#~ <:&1)@:,@(%/~@(1 + i.))          NB. tacit version of Farey_rdm

Farey_oldman=: {{ x: /:~ ,&0 1 ~. (#~ <&1) , (1&+ %/ 2&+) i.y-1 }}
FareyT_oldman=: /:~@(0 1 , ~.)@(#~ <&1)@:,@(1 2 %//@(+/) i.@<:)   NB. tacit version of Farey_oldman
)

Farey=: x:@/:~@(0 , ~.)@(#~ <:&1)@:,@(%/~@(1 + i.))      NB. calculates Farey sequence
displayFarey=: ('r/' charsub '0r' , ,&'r1')@":           NB. displays Farey sequence according to task requirements
order=: ': ' ,~ ":                                       NB. display order of Farey sequence

Note 'Required examples:'
   LF joinstring (order , displayFarey@Farey)&.> 1 + i.11
1: 0/0 1/1
2: 0/0 1/2 1/1
3: 0/0 1/3 1/2 2/3 1/1
4: 0/0 1/4 1/3 1/2 2/3 3/4 1/1
5: 0/0 1/5 1/4 1/3 2/5 1/2 3/5 2/3 3/4 4/5 1/1
6: 0/0 1/6 1/5 1/4 1/3 2/5 1/2 3/5 2/3 3/4 4/5 5/6 1/1
7: 0/0 1/7 1/6 1/5 1/4 2/7 1/3 2/5 3/7 1/2 4/7 3/5 2/3 5/7 3/4 4/5 5/6 6/7 1/1
8: 0/0 1/8 1/7 1/6 1/5 1/4 2/7 1/3 3/8 2/5 3/7 1/2 4/7 3/5 5/8 2/3 5/7 3/4 4/5 5/6 6/7 7/8 1/1
9: 0/0 1/9 1/8 1/7 1/6 1/5 2/9 1/4 2/7 1/3 3/8 2/5 3/7 4/9 1/2 5/9 4/7 3/5 5/8 2/3 5/7 3/4 7/9 4/5 5/6 6/7 7/8 8/9 1/1
10: 0/0 1/10 1/9 1/8 1/7 1/6 1/5 2/9 1/4 2/7 3/10 1/3 3/8 2/5 3/7 4/9 1/2 5/9 4/7 3/5 5/8 2/3 7/10 5/7 3/4 7/9 4/5 5/6 6/7 7/8 8/9 9/10 1/1
11: 0/0 1/11 1/10 1/9 1/8 1/7 1/6 2/11 1/5 2/9 1/4 3/11 2/7 3/10 1/3 4/11 3/8 2/5 3/7 4/9 5/11 1/2 6/11 5/9 4/7 3/5 5/8 7/11 2/3 7/10 5/7 8/11 3/4 7/9 4/5 9/11 5/6 6/7 7/8 8/9 9/10 10/11 1/1
   LF joinstring (order , ":@#@Farey)&.> 100 * 1 + i.10
100: 3045
200: 12233
300: 27399
400: 48679
500: 76117
600: 109501
700: 149019
800: 194751
900: 246327
1000: 304193
)
