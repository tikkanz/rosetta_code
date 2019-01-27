Note 'Square-free integers'
http://rosettacode.org/wiki/Square-free_integers#J
)

isSqrFree=: (#@~. = #)@q:     NB. are there duplicates in the prime factors of a number
filter=: adverb def ' #~ u'   NB. filter right arg using verb to left
countSqrFree=: +/@:isSqrFree

thru=: <. + i.@(+ *)@-~       NB. helper verb

Note 'Examples'
isSqrFree filter 1 thru 145   NB. returns all results but not all are displayed
list isSqrFree filter 1000000000000 thru 1000000000145
countSqrFree 1 thru 100
countSqrFree 1 thru 1000
countSqrFree 1 thru 10000
countSqrFree 1 thru 100000
countSqrFree 1 thru 1000000
1 countSqrFree@thru&> 10 ^ 2 3 4 5 6
)
