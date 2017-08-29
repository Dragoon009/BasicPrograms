require './input'
require './taxcalc'
require './output'

input_object = SalesTaxCalc::Input.new
price = input_object.userinput
name = input_object.inputname

calc_object = SalesTaxCalc::TaxCalc.new
cost = calc_object.algo_method(name,price)
#tax = calc_object.round


output_object = SalesTaxCalc::TaxCalc.new
output = output_object.output_method(name,calculated,'13')
