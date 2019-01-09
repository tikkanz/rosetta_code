Note 'Shoelace formula for polygonal area'
http://rosettacode.org/wiki/Shoelace_formula_for_polygonal_area#J
)

shoelaceX0=: verb define
  0.5 * | +/ ((* 1&|.)/ - (* _1&|.)/) |: y
)

shoelace0=: -:@:|@:(+/)@((* 1&|.)/ - (* _1&|.)/)@|:

shoelaceX0=: verb define
  0.5 * | ((+/@:* 1&|.)/ - (+/@:* _1&|.)/) |: y
)

shoelaceX0=: verb define
  0.5 * | ((* 1&|.)/ -&(+/) (* _1&|.)/) |: y
)

shoelace0=: -:@:|@:((* 1&|.)/ -&(+/) (* _1&|.)/)@|:

shoelaceX=: verb define
  -: | -/ (|. +/"1@:* 1&|."1) |: y
)

shoelace=: -:@|@:(-/)@(|. +/"1@:* 1&|."1)@|:

Note 'Example Use:'
Points0=: 2 1,4 5,:7 8
Points1=: 3 4,5 11,12 8,9 5,:5 6
Points2=: 2 4,3 _8, 1 2,:2 4

shoelaceX0 Points1
shoelace0 Points1
shoelaceX Points1
shoelace Points1

)
