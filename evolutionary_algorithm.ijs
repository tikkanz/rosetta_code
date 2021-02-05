Note 'Evolutionary Algorithm'
https://rosettacode.org/wiki/Evolutionary_algorithm#J
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

NB. Alternative version with explicit mutate and evolve

CHARSET=: 'ABCDEFGHIJKLMNOPQRSTUVWXYZ '
NPROG=:   100                             NB. "C" from specification
 
fitness=: +/@:~:"1
select=: ] {~ (i. <./)@:fitness           NB. select fittest member of population
populate=: (?@$&# { ])&CHARSET            NB. get random list from charset of same length as y
log=: [: smoutput [: ;:inv (('#';'fitness: ';'; ') ,&.> ":&.>)
 
mutate=: dyad define
  idxmut=. I. x >: (*/$y) ?@$ 0
  (populate idxmut) idxmut"_} y
)
 
evolve=: monad define
  target=. y
  parent=. populate y
  iter=. 0
  mrate=. %#y
  while. 0 < val=. target fitness parent do.
    if. 0 = 50|iter do. log iter;val;parent end.
    iter=. iter + 1
    progeny=. mrate mutate NPROG # ,: parent  NB. create progeny by mutating parent copies
    parent=. target select parent,progeny     NB. select fittest parent for next generation
  end.
  log iter;val;parent
  parent
)

Note 'Example Usage:'
   evolve 'METHINKS IT IS LIKE A WEASEL'
#0 fitness: 27 ; YGFDJFTBEDB FAIJJGMFKDPYELOA
#50 fitness: 2 ; MEVHINKS IT IS LIKE ADWEASEL
#76 fitness: 0 ; METHINKS IT IS LIKE A WEASEL
METHINKS IT IS LIKE A WEASEL
)