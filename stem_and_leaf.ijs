Note 'Stem and Leaf'
http://rosettacode.org/wiki/Stem-and-leaf_plot#J
)

NB. Tacit
stem        =: <.@(%&10)
leaf        =: 10&|
stemleaf    =: (stem@{. ; leaf)/.~ stem
expandStems =: <./ ([ + i.@>:@-~) >./
expandLeaves=: (expandStems e. ])@[ #inv ]
 
showStemLeaf=: (":@,.@expandStems@[ ; ":&>@expandLeaves)&>/@(>@{. ; <@{:)@|:@stemleaf@/:~

NB. Explicit
stemleafX=: monad define
  leaves=. 10 | y
  stems=. y <.@:% 10
  leaves=. stems </. leaves                           NB. group leaves by stem
  (<"0 ~.stems),.leaves
)
 
showStemLeafX=: monad define
  'stems leaves'=. (>@{. ; <@{:)@|: stemleafX /:~ y
  xstems=. (<./ ([ + i.@>:@-~ ) >./) stems            NB. stems including those with no leaves
  xleaves=. (xstems e. stems) #inv leaves             NB. expand leaves to match xstems
  (": ,.xstems) ; ":&> xleaves
)


nls =: ; <@(_&".);._2 noun define
12 127 28 42 39 113 42 18 44 118 44 37 113 124 37 48 127 36 29 31 125       
139 131 115 105 132 104 123 35 113 122 42 117 119 58 109 23 105 63 27 44 105
99 41 128 121 116 125 32 61 37 127 29 113 121 58 114 126 53 114 96 25 109   
7 31 141 46 13 27 43 117 116 27 7 68 40 31 115 124 42 128 52 71 118         
117 38 27 106 33 117 116 111 40 119 47 105 57 122 109 124 115 43 120 43 27  
27 18 28 48 125 107 114 34 133 45 120 30 127 31 116 146                     
)

Note 'Example'
stemleaf nls
showStemLeaf nls
(showStemLeaf -: showStemLeafX) nls   NB. both solutions give same result
)