Note 'Cheryl''s Birthday'
https://rosettacode.org/wiki/Cheryl%27s_Birthday#J
)

date=: 'May 15, May 16, May 19, June 17, June 18, July 14, July 16, August 14, August 15, August 17'

Dates=: <;._2 noun define
15 May
16 May
19 May
17 June
18 June
14 July
16 July
14 August
15 August
17 August
)

getDayMonth=: |:@:(' '&splitstring&>)                      NB. retrieve lists of days and months from dates
keep=: adverb def '] #~ u'                                 NB. apply mask to filter dates
keep=: (]`(#~)`) (`:6)                                     NB. tacit alternative
monthsWithUniqueDay=: {./. #~ (1=#)/.                      NB. list months that have a unique day
isMonthWithoutUniqueDay=: (] -.@e. monthsWithUniqueDay)/@getDayMonth  NB. mask of dates with a month that doesn't have a unique day

uniqueDayInMonth=: ~.@[ #~ (1=#)/.                         NB. list of days that are unique to 1 month
isUniqueDayInMonth=: ([ e. uniqueDayInMonth)/@getDayMonth  NB. mask of dates with a day that is unique to 1 month

uniqueMonth=: ~.@] #~ (1=#)/.~                             NB. list of months with 1 unique day
isUniqueMonth=: (] e. uniqueMonth)/@getDayMonth            NB. mask of dates with a month that has 1 unique day

Note 'Usage'
isMonthWithoutUniqueDay keep Dates
isUniqueDayInMonth keep isMonthWithoutUniqueDay keep Dates
isUniqueMonth keep isUniqueDayInMonth keep isMonthWithoutUniqueDay keep Dates
)

Note 'working'
'Day Month'=: getDayMonth Dates
Month (~.@[ #~ (1=#)/.) Day             NB. months with only one day
Month (~.@[ #~ (1 < #)/.) Day           NB. months with more than one day
,/&> Day (</. #~ (1=#)/.) Month         NB. months with unique days
~.Month -.  ,/&> Day (</. #~ (1=#)/.) Month  NB. months without unique days
(] #~ (] -.@e. {./. #~ (1=#)/.)/@getDayMonth) Dates NB. dates with
(] #~ (] -.@e. monthsWithUniqueDay)/@getDayMonth) Dates NB. dates get Months without unique days
)