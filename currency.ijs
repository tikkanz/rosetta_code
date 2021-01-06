Note 'Currency'
https://rosettacode.org/wiki/Currency#J
)

require 'format/printf'
 
Items=:    ;:    'Hamburger     Milkshake'
Quantities=:   4000000000000000      2
Prices=:   x:        5.50          2.86
Tax_rate=: x:  0.0765

Values=: Quantities * Prices
Subtotal=: +/ Values
Tax=: Tax_rate * Subtotal
Total=: Subtotal + Tax
 
OutputTemplate=: noun define
Item         Price             Quantity          Value
%9s %8.2f %20d %22.2f
%9s %8.2f %20d %22.2f
                               -------------------------------
                               Subtotal: %21.2f
                                    Tax: %21.2f
                                  Total: %21.2f
)
 
Vals=: (,Items ,. (<"0 Prices ,. Quantities ,. Values)) , Subtotal;Tax;Total
OutputTemplate printf Vals
