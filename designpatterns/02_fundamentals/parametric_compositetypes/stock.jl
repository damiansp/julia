using InteractiveUtils

abstract type Asset end

abstract type Property <: Asset end
abstract type Investment <: Asset end
abstract type Cash <: Asset end

abstract type House <: Property end
abstract type Apartment <: Property end

abstract type Bond <: Investment end
abstract type Equity <: Investment end



# Designing composite types
struct Stock <: Equity
	symbol::String
	name::String
end

#=
struct stockHolding
	stock::Stock
	quantity::Int
end

# What about fractional shares?
struct stockHolding
	stock::Stock
	quantity::Float64
end
=#

# merge previous two:
struct StockHolding1{T <: Real}
	stock::Stock
	quantity::T
end

stock = Stock("AAPL", "Apple")
holding = StockHolding1(stock, 100)
println(holding)
holding = StockHolding1(stock, 100 // 3)
println(holding)

# Develop further
struct stockHolding2{T <: Real, P <: AbstractFloat}
	stock::Stock
	quantity::T
	price::P
	marketvalue::P
end

holding = stockHolding2(stock, 100, 180., 18000.)
println(holding)


abstract type Holding{P} end

struct StockHolding3{T, P} <: Holding{P}
	stock::Stock
	quantity::T
	price::P
	marketvalue::P
end

struct CashHoldint{P} <: Holding{P}
	currency::String
	amount::P
	marketvalue::P
end

println(StockHolding3{Int64, Float64} <: Holding{Float64}) # true

certificate_inthesafe = StockHolding3(stock, 100, 180., 18000.)
println(certificate_inthesafe isa Holding{Float64}) # true
