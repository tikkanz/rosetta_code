Note 'Range Consolidation'
http://rosettacode.org/wiki/Range_consolidation#J
)

ensure2D=: ,:^:(1 = #@$)             NB. if list make 1 row table
normalise=: ([: /:~ /:~"1)@ensure2D  NB. normalises list of ranges
merge=: ,:`(<.&{. , >.&{:)@.(>:/&{: |.)

consolidate=: (}.@] ,~ (merge {.)) ensure2D

tests=:  <@".;._2 noun define
1.1 2.2
6.1 7.2 ,: 7.2 8.3
4 3 ,: 2 1
4 3 , 2 1 , _1 _2 ,: 3.9 10
1 3 , _6 _1 , _4 _5 , 8 2 ,: _6 _6
)

consolidate/@normalise&.> tests

Note 'Old versions'
merge=: ,:`(<.&{. , >.&{:)@.({:@[ >: {.@])

consolidate=: 4 :0
  merge=: (,:)`(<.&{. , >.&{:)@.({:@[ >: {.@]) 
  if. 2 = #@$ y do.
    last=. {. y
    out=. (x merge last) , }. y
  else.
    out=. x merge y
  end.
  out
) NB. remove comment to use

consolidate=: 4 :0
  last=. {. ensuretable y
  (x merge last) , }. ensuretable y
)  NB. remove comment to use

consolidate=: }.@ensuretable@] ,~ ((merge {.) ensuretable)
)