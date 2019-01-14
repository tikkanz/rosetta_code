Note 'Evolutionary Algorithm'
http://rosettacode.org/wiki/Evolutionary_algorithm#J
)

CHARSET=: 'ABCDEFGHIJKLMNOPQRSTUVWXYZ '
NPROG=:   100                            NB. number of progeny (C)
MRATE=:   0.05                           NB. mutation rate
 
create  =: (?@$&$ { ])&CHARSET           NB. creates random list from charset of same shape as y
fitness =: +/@:~:"1
copy    =: # ,:
mutate  =: &(>: $ ?@$ 0:)(`(,: create))} NB. adverb
select  =: ] {~ (i. <./)@:fitness        NB. select fittest member of population
 
nextgen =: select ] , [: MRATE mutate NPROG copy ]
while   =: conjunction def '(] , (u {:))^:(v {:)^:_ ,:'
 
evolve=: nextgen while (0 < fitness) create

Note 'Example usage:'
   filter=: {: ,~ ({~ i.@>.&.(%&20)@#)   NB. take every 20th and last item
   filter evolve 'METHINKS IT IS LIKE A WEASEL'
XXURVQXKQXDLCGFVICCUA NUQPND
MEFHINVQQXT IW LIKEUA WEAPEL
METHINVS IT IW LIKEUA WEAPEL
METHINKS IT IS LIKE A WEASEL
)