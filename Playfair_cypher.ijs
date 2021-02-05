Note 'Playfair cypher'
https://rosettacode.org/wiki/Playfair_cypher#J
)

choose=: {{
  sel=. 'Q' e. y
  alph=: (sel { 'JQ') -.~ a. {~ 65 + i.26
  norm=: [: dedouble alph restrict ('I' I.@:=&'J'@]} ])`(-.&'Q')@.sel@toupper
  ''
}}

restrict=: ] -. -.~

getidx=: 1 >:@+:@i.~ =/"1@(_2 ]\ ])
splitDigraph=: ({. , 'X' , }.)~ getidx
dedouble=: dtb@(>:@# {. splitDigraph)^:_

choose 'Q'
 
setkey=: {{
  key=. ~.norm y,alph
  ref=: ,/ 2{."1 ~."1 (,"0/~ alph) ,"1 norm 'XQV'
  mode=. #. =/"2 inds=. 5 5#:key i. ref
  inds0=. (0 3,:2 1)&{@,"2 inds
  inds1=. 5|1 0 +"1 inds NB. same column
  inds2=. 5|0 1 +"1 inds NB. same row
  alt=: key {~ 5 #. mode {"_1 inds0 ,"2 3 inds1 ,:"2 inds2
  i. 0 0
}}
 
pairs=: {{ 2{."1 -.&' '"1 ~."1 (_2]\ norm y) ,"1 'XQV' }}
 
encrypt=: {{ ;:inv ;/ alt{~ref i. pairs y }}
 
decrypt=: {{ ;:inv ;/ ref{~alt i. pairs y }}

Note 'Required Example'
   choose 'IJ'

   setkey 'playfair example'
   encrypt 'Hide the gold in the tree stump'
BM OD ZB XD NA BE KU DM UI XM MO UV IF
   decrypt 'BM OD ZB XD NA BE KU DM UI XM MO UV IF'
HI DE TH EG OL DI NT HE TR EX ES TU MP
)

Note 'Other implementations of dedouble from J forum'
dd_bg=: {{ ((+where&<)#y) {. ({.&y ,'X', }.&y) where =. >: +: 1 i.~ _2 =/\ y,'XX',(2|#y){.'X' }}^:_
dd_bg=: {{ ((+ idx&<)#y) {. y ({. ,'X', }.)~ idx =. >:+: 1 i.~ (=/"1) _2 ]\y }}^:_
dd_bg=: {{ 
  idx =. >:+: 1 i.~ (=/"1) _2 ]\y
  idx ((#@] + (< #)) {. ({. ,'X', }.)) y
}}^:_


digra=: * 2 | i.@# + +/\
dd_rm=: #!.'X'~ 1 j. [: digra # {. }. = }:

dd_pj=: ;@:(_2&(,`([,'X',])@.=/each@<\))^:_
dd_pj2=: (' ' -.~ ,)@:(_2&(,`([,'X',])@.=/\))^:_

dd_md=: dtb@:((] ({.~ , 'X' , }.~) 1 (1 + 2 * i.)~ _2 =/\ ]) {.~ >:@#) ::($:@:,&' ')
dd_md2=: dd_md^:_

getidx=: 1 >:@+:@i.~ =/"1@(_2 ]\ ])
splitDigraph=: ({. , 'X' , }.)~ getidx
dedouble=: dtb@(>:@# {. splitDigraph)^:_

showDigraphs=: dquote@(',' joinstring _2 <\ ])

'data1 soln1'=: 'THEEQUICKBROWFFOX';'THEXEQUICKBROWFXFOX'
'data2 soln2'=: 'THEEQUICKBROWFOOX';'THEXEQUICKBROWFOOX'
'data3 soln3'=: 'TTHEEQUICKBROWFFOX';'TXTHEXEQUICKBROWFXFOX'
'data4 soln4'=: 'TTHEEQUICKBROWFOOOX';'TXTHEXEQUICKBROWFOOXOX'
'data5 soln5'=: '';''

([: showDigraphs dd_bg) &> data1;data2;data3;data4;data5
([: showDigraphs dd_md^:_) &> data1;data2;data3;data4;data5
)
