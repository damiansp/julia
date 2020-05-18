module Calculator

include("Mortgage.jl")
include("Banking.jl")

export interest, rate

"""
  interest(amount, rate)
Calculate interest from an `amount` and an interest rate of `rate`.
"""
function interest(amount, rate)
  return amount * (1 + rate)
end


"""
  rate(amount, interest)
Calculate interest rate base on `amount` and `interest`.
"""
function rate(amount, interest)
  return interest / amount
end


# To make use of these functions in another module:
# make sure to export
# > using Calculator
# interest() and rate() are now available

# or 
# using Calculator: interest
# > only interest() is available

# or
# > import Calculator
# available as Calculator.interest(), Calculator.rate()

# > import Calculator.interest # or
# > import Calculator: interest
# available as interest()

# Generally:
# use `using` when needing just the functionality
# use `import` when extending functionality

end # module
