Note 'Find intersection of two lines'
http://rosettacode.org/wiki/Verify_distribution_uniformity/Chi-squared_test#J
)

NB. Tacit
require 'stats/base'
 
countCats=: #@~.                    NB. counts the number of unique items
getExpected=: #@] % [               NB. divides no of items by category count
getObserved=: #/.~@]                NB. counts frequency for each category
calcX2=: [: +/ *:@(getObserved - getExpected) % getExpected   NB. calculates test statistic 
calcDf=: <:@[                       NB. calculates degrees of freedom for uniform distribution
 
NB.*isUniform v Tests (5%) whether y is uniformly distributed
NB. result is: boolean describing if distribution y is uniform
NB. y is: distribution to test
NB. x is: optionally specify number of categories possible
isUniform=: (countCats $: ]) : (0.95 > calcDf chisqcdf :: 1: calcX2)


NB. Explicit
require 'stats/base'

NB.*isUniformX v Tests (5%) whether y is uniformly distributed
NB. result is: boolean describing if distribution y is uniform
NB. y is: distribution to test
NB. x is: optionally specify number of categories possible
isUniformX=: verb define
  (#~. y) isUniformX y
:
  signif=. 0.95                    NB. set significance level
  expected=. (#y) % x              NB. number of items divided by the category count
  observed=. #/.~ y                NB. frequency count for each category
  X2=. +/ (*: observed - expected) % expected  NB. the test statistic
  degfreedom=. <: x                NB. degrees of freedom
  signif > degfreedom chisqcdf :: 1: X2
)

Note 'Example Usage'
   FairDistrib=:      1e6 ?@$ 5
   UnfairDistrib=: (9.5e5 ?@$ 5) , (5e4 ?@$ 4)
   isUniformX FairDistrib    NB. 1
   isUniformX UnfairDistrib  NB. 0
   isUniform 4 4 4 5 5 5 5 5 5 5     NB. uniform if only 2 categories possible
   4 isUniform 4 4 4 5 5 5 5 5 5 5   NB. not uniform if 4 categories possible
)