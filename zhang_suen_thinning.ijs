Note 'Zhang-Suen thinning algorithm'
http://rosettacode.org/wiki/Zhang-Suen_thinning_algorithm#J
)

NB. Tacit
isBlackPx=: '1'&=;._2             NB. boolean array of black pixels
toImage=: [: , LF ,.~ '01' {~ ]   NB. convert to original representation
frameImg=: 0 ,. 0 , >:@$ {. ]     NB. adds border of 0's to image
 
neighbrs=: adverb define          NB. applies verb u to neighbourhoods
  (1 1 ,: 3 3) u;._3 y
)

neighbrs=: 1 :'(1 1 ,: 3 3)&(u;._3)'  NB. applies verb u to neighbourhoods

Bdry=: 1 2 5 8 7 6 3 0 1          NB. map pixel index to neighbour order 
getPx=: { ,                       NB. get desired pixels from neighbourhood
Ap1=: [: +/ 2 </\ Bdry&getPx      NB. count 0->1 transitions
Bp1=: [: +/ [: }. Bdry&getPx      NB. count black neighbours
 
c11=: (2&<: *. <:&6)@Bp1          NB. step 1, condition 1
c12=: 1 = Ap1                     NB. ...
c13=: 0 e. 1 5 7&getPx
c14=: 0 e. 5 7 3&getPx
c23=: 0 e. 1 5 3&getPx            NB. step2, condition 3
c24=: 0 e. 1 7 3&getPx
 
cond1=: c11 *. c12 *. c13 *. c14  NB. step1 conditions
cond2=: c11 *. c12 *. c23 *. c24  NB. step2 conditions
whiten=: [ * -.@:*.               NB. make black pixels white
step1=: whiten frameImg@(cond1 neighbrs)
step2=: whiten frameImg@(cond2 neighbrs)
 
zhangSuen=: [: toImage [: step2@step1^:_ isBlackPx

NB. Explicit
zhangSuenX=: verb define
  img=. isBlackPx y
  whilst. 0 < +/ , msk1 +.&-. msk2 do.
    msk1=. (-.@:*. [: frameImg cond1 neighbrs) img
    img=. msk1 * img
    msk2=. (-.@:*. [: frameImg cond2 neighbrs) img
    img=. msk2 * img
  end.
  toImage img
)

NB. Example Use
 
ExampleImg=: noun define
00000000000000000000000000000000
01111111110000000111111110000000
01110001111000001111001111000000
01110000111000001110000111000000
01110001111000001110000000000000
01111111110000001110000000000000
01110111100000001110000111000000
01110011110011101111001111011100
01110001111011100111111110011100
00000000000000000000000000000000
)

ExampleImg2=: toImage '#'&=;._2 noun define
                                                           
 #################                   #############         
 ##################               ################         
 ###################            ##################         
 ########     #######          ###################         
   ######     #######         #######       ######         
   ######     #######        #######                       
   #################         #######                       
   ################          #######                       
   #################         #######                       
   ######     #######        #######                       
   ######     #######        #######                       
   ######     #######         #######       ######         
 ########     #######          ###################         
 ########     ####### ######    ################## ######  
 ########     ####### ######      ################ ######  
 ########     ####### ######         ############# ######  
                                                           
)


Note 'Example Use:'
   toASCII=: ' #' {~ '1'&=;._2       NB. convert to ASCII representation
   toASCII zhangSuen ExampleImg
   toASCII zhangSuen ExampleImg2
)