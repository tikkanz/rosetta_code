Note 'Playing cards'
http://rosettacode.org/wiki/Playing_cards#J
)

NB. playingcards.ijs
NB. Defines a Rosetta Code playing cards class
NB. Multiple decks may be used, one for each instance of this class.
 
coclass 'rcpc'    NB. Rosetta Code playing cards class
 
NB. Class objects
Ranks=: _2 ]\ ' A 2 3 4 5 6 7 8 910 J Q K'
Suits=: ucp '♦♣♥♠'
DeckPrototype=: (] #: i.@:*/)Ranks ,&# Suits
 
NB. Class methods
create=: monad define
 1: TheDeck=: DeckPrototype
)
 
destroy=: codestroy
 
sayCards=: ({&Ranks@{. , {&Suits@{:)"1
 
shuffle=: monad define
 1: TheDeck=: ({~ ?~@#) TheDeck
)
 
NB.*dealCards v Deals y cards [to x players]
NB. x is: optional number of players, defaults to one
NB. Used monadically, the player-axis is omitted from output.
dealCards=: verb define
 {. 1 dealCards y
:
 'Too few cards in deck' assert (# TheDeck) >: ToBeDealt=. x*y
 CardsOffTop=. ToBeDealt {. TheDeck
 TheDeck    =: ToBeDealt }. TheDeck
 (x,y)$ CardsOffTop
)
 
NB.*pcc v "Print" current contents of the deck.
pcc=: monad define
 sayCards TheDeck
)
 
newDeck_z_=: conew&'rcpc'

Note 'Example use'
   load 'playing_cards.ijs'
   coinsert 'rcpc'              NB. insert rcpc class in the path of current locale
   pc=: newDeck ''
   $TheDeck__pc
52 2
   shuffle__pc ''
1
   sayCards 2 dealCards__pc 5   NB. deal two hands of five cards
 3♦
 4♦
 K♠
 A♦
 K♦
 
 5♠
10♣
 Q♥
 2♣
 9♣
   $TheDeck__pc                 NB. deck size has been reduced by the ten cards dealt
42 2
   destroy__pc ''
)
