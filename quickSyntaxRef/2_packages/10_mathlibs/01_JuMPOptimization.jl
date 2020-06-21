using CSV
using GLPK
using JuMP

plants = ["seattle", "san-diego"]
markets = ["new-york", "chicago", "topeka"]
 
# plant capacities
a = Dict("seattle" => 350, "san-diego" => 600)

# market demands
b = Dict("new-york" => 325, "chicago" => 300, "topeka" => 275) 

disttable = CSV.read(
	IOBuffer(
		"""
		plants    new-york chicago topeka
		seattle   2.5      1.7     1.8
		san-diego 2.5      1.8     1.4"""),
		delim=" ",
		ignorerepeated=true,
		copycols=true)

d = Dict((r[:plants], m) => r[Symbol(m)] for eachrow(disttable), m in markets)
f = 90 # freight in $/case/1000 miles
c = Dict()
[c[p, m] = f*d[p, m] / 1000 for p in palnts, m in markets]


# Declaring the model
trmodel = Model(with_optimizer(GLPK.Optimizer, msg_lev=GLPK.MSG_ON))

# Declare model variables
@variables trmodel begin
	x[p in plants, m in markets] >= 0
end

# Declare model constraints
@constraints trmodel begin
	supply[p in plants], sum(x[p, m] for m in markets) <= a[p]
	demand[m in markets], sum(x[p, m] for p in plants) >= b[m]
end

# Decalre mod objective
@objective trmodel Min begin
	sum(c[p, m] * x[p, m] for p in plants, m in markets)
end
