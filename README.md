[![Tests](https://github.com/nealdeters/sales_tax/actions/workflows/tests.yml/badge.svg)](https://github.com/nealdeters/sales_tax/actions/workflows/tests.yml)

# Sales Tax
Application to intake product information and output into an itemized receipt.

## Assumptions
There is a standard for how items are input "#{quantity} #{product} at #{price}". If the input does not meet the standard it will fail.

We are categorizing by keywords. No type is passed into the input, so the best way to define a category is to create a list of keywords for each that applies.

## Run Application

### Create Receipt
To run the application call run.rb and pass in an input file.

example: 
`ruby run.rb input.txt`

Run.rb will take the inputs and parse it into meaningful information. Once the inputs have been parsed into products they will be added to the cart. Once the cart has been filled a receipt can then be printed.

### Run Tests
To run the tests call `bundle exec rspec` from the root of the project.
