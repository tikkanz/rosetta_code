Note 'Currency'
https://rosettacode.org/wiki/Currency#J
)

require 'format/printf'
fmtD=: 0j2&":     NB. format rational as decimal
 
Items=:   ;:          'Hamburger     Milkshake'
Quantities=: x:   4000000000000000      2
Prices=:   x:           5.50          2.86
Tax_rate=: x:  0.0765
Values=: Quantities * Prices
Subtotal=: +/ Values
Tax=: Tax_rate * Subtotal
Total=: Subtotal + Tax
 
OutputTemplate=: noun define
Item          Price            Quantity          Value
%9s %8s %20d %22s
%9s %8s %20d %22s
                               -------------------------------
                               Subtotal:  %20s
                                    Tax:  %20s
                                  Total:  %20s
)
 
Vals=: (,Items ,. (fmtD&.> Prices) ,. (<"0 Quantities) ,. (fmtD&.> Values)) , fmtD&.> Subtotal,Tax,Total
OutputTemplate printf Vals
