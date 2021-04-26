Note 'Midpoint circle algorithm'
https://rosettacode.org/wiki/Bitmap/Midpoint_circle_algorithm#J
)

load 'bitmap.ijs'

NB.*getBresenhamCircle v Returns points for a circle given center and radius
NB. y is: y0 x0 radius
getBresenhamCircle=: monad define
  'y0 x0 radius'=. y
  x=. 0
  y=. radius
  f=. -. radius
  pts=. 0 2$0
  while. x <: y do.
    pts=. pts , y , x
    if. f >: 0 do.
      y=. <:y
      f=. f + _2 * y
    end.
    x=. >:x
    f =. f + >: 2 * x
  end.
  offsets=. (,|."1) (1 _1 {~ #: i.4) *"1"1 _ pts
  ~.,/ (y0,x0) +"1 offsets
)
 
NB.*drawCircles v Draws circle(s) (x) on image (y)
NB. x is: 2-item list of boxed (y0 x0 radius) ; (color)
drawCircles=: (1&{:: ;~ [: ; [: <@getBresenhamCircle"1 (0&{::))@[ setPixels ]


Note 'Example Use'
   myimg=: 0 255 0 makeRGB 25 25                              NB. 25 by 25 green image
   myimg=: (12 12 12 ; 255 0 0) drawCircles myimg              NB. draw red circle with radius 12
   viewRGB ((12 12 9 ,: 12 12 6) ; 0 0 255) drawCircles myimg  NB. draw two more concentric circles
)
