Note 'Bitmap'
https://rosettacode.org/wiki/Bitmap/
)

makeRGB=: 0&$: : (($,)~ ,&3)
fillRGB=: makeRGB }:@$
setPixels=: (1&{::@[)`(<"1@(0&{::@[))`]}
getPixels=: <"1@[ { ]

Note 'Examples'
   myimg=: makeRGB 5 8               NB. create a bitmap with height 5 and width 8 (black)
   myimg=: 255 makeRGB 5 8           NB. create a white bitmap with height 5 and width 8
   myimg=: 127 makeRGB 5 8           NB. create a gray bitmap with height 5 and width 8
   myimg=: 0 255 0 makeRGB 5 8       NB. create a green bitmap with height 5 and width 8
   myimg=: 0 0 255 fillRGB myimg     NB. fill myimg with blue
   colors=: 0 255 {~ #: i.8          NB. black,blue,green,cyan,red,magenta,yellow,white
   myimg=: colors fillRGB myimg      NB. fill myimg with vertical stripes of colors
   2 4 getPixels myimg               NB. get the pixel color from point (2, 4)

   myimg=: (2 4 ; 255 255 255) setPixels myimg   NB. set pixel at point (2, 4) to white
   2 4 getPixels myimg               NB. get the pixel color from point (2, 4)

   }:$ myimg                         NB. get height and width of the image

NB. getPixels and setPixels are generalized to set and get lists/arrays of pixels. 
pixellist=: ,"0/~ i. 10  NB. row and column indices for 10 by 10 block of pixels
 
NB. create 10 by 10 block of magenta pixels in the middle of a 300 by 300 green image
myimg=: ((145 + pixellist) ; 255 0 255) setPixels 0 255 0 makeRGB 300 300
 
NB. get pixel color for 10x10 block offset from magenta block
subimg=: (140 + pixellist) getPixels myimg
)

NB. To display the image in a window at any point for verification: 
require 'viewmat'
viewRGB=: [: viewrgb 256&#.
 
NB. viewRGB myimg



Note 'Write a PPM'
NB. https://rosettacode.org/wiki/Bitmap/Write_a_PPM_file#J
)

require 'files'
 
NB. ($x) is height, width, colors per pixel
writeppm=: dyad define
  header=. 'P6',LF,(":1 0{$x),LF,'255',LF
  (header,,x{a.) fwrite y
)

Note 'Example Usage'
 NB. create 10 by 10 block of magenta pixels in top right quadrant of a 300 wide by 600 high green image
   pixellist=: >,{;~i.10
   myimg=: ((150 + pixellist) ; 255 0 255) setPixels 0 255 0 makeRGB 600 300
   myimg writeppm jpath '~temp/myimg.ppm'
)

Note 'Read a PPM file'
https://rosettacode.org/wiki/Bitmap/Read_a_PPM_file#J
)

require 'files'
 
readppm=: monad define
  dat=. fread y                                           NB. read from file
  msk=. 1 ,~ (*. 3 >: +/\) (LF&=@}: *. '#'&~:@}.) dat     NB. mark field ends
  't wbyh maxval dat'=. msk <;._2 dat                     NB. parse
  'wbyh maxval'=. 2 1([ {. [: _99&". (LF,' ')&charsub)&.> wbyh;maxval  NB. convert to numeric
  if. (_99 0 +./@e. wbyh,maxval) +. 'P6' -.@-: 2{.t do. _1 return. end.
  (a. i. dat) makeRGB |.wbyh                              NB. convert to basic bitmap format
)

Note 'Example'
myimg=: readppm jpath '~temp/myimg.ppm'
myimgGray=: toColor toGray myimg
myimgGray writeppm jpath '~temp/myimgGray.ppm'
)

Note 'Grayscale_image'
https://rosettacode.org/wiki/Grayscale_image#J
)

NB. converts the image to grayscale according to formula
NB. L = 0.2126*R + 0.7152*G + 0.0722*B
toGray=: [: <. +/ .*"1&0.2126 0.7152 0.0722
 
NB. converts grayscale image to the color image, with all channels equal
toColor=: 3 & $"0

Note 'Example'
   viewRGB toColor toGray myimg
)
