using CSV
using DataFrames
using DataFramesMeta
using Query


# 2. Creating or loading DF
df = DataFrame(
	region=["US", "US", "US", "US", "EU", "EU", "EU", "EU"],
	product=[
		"Hardwood", "Hardwood", "Softwood", "Softwood", "Hardwood", "Hardwood", 
		"Softwood", "Softwood"],
	year=[2010, 2011, 2010, 2011, 2012, 2012, 2011, 2010],
	production=[3.3, 3.2, 2.3, 2.1, 2.7, 2.8, 1.5, 1.3],
	consumption=[4.3, 7.4, 2.5, 9.8, 3.2, 4.3, 6.5, 3.0])

df2 = DataFrame(A=Int64[], B=Float64[])

mat = [1 2 3; 4 5 6]
headers = ["c1", "c2", "c3"]
df3 = DataFrame([[mat[:, i]...] for i in 1:size(mat, 2)], Symbol.(headers))

mat2 = ["c1" "c2" "c3"; 1 2 3; 4 5 6]
df4 = DataFrame([[mat2[2:end, i]...] for i in 1:size(mat2, 2)], 
								Symbol.(mat2[1, :]))



# 3. Getting Insights about the Data
show(df)
println(first(df3, 3))
println(last(df4, 3))
println(describe(df))
println(names(df2))
println(unique(df3.c1))
println([eltype(c) for c in eachcol(df4)])
println(size(df))



# 4 Filter Data (Selecting/Querying)
println(df[:, :region]) # by copy
println(df[!, :product]) # by reference
println(df.year)
println(df[!, 4]) # 4th col

println(df[1, :])
println(df.consumption[1])
println(df[1, :region])

println(df[[i in ["US", "Canada"] for i in df.region], :])
println(
	df[([i in ["US", "Canada"] for i in df.region] .> 0) .& (df.year .== 2010), :])
println(df[startswith.(df.region, "E"), :])

#println(@where (df, :production .> 3, cols(:region) .== "US"))

dfout = @from i in df begin # iterate over rows
	@where i.region == "US"
	@select {i.product, i.year, usproduction=i.production}
	@collect DataFrame
end
println(dfout)

dfout = @from i in df begin
	@where i.production >= 3 && i.region in ["US", "Canada"]
	@select i # whole row
	@collect DataFrame
end
println(dfout)



# 5. Editing Data
#df[8, :region] .= "US"
df[(df.region .== "EU"), :region] .= "Canada"
show(df)
println()

push!(df, ["EU", "Softwood", 2012, 5.2, 6.2])
df.regprod = df.region .* " " .* df.product
deleterows!(df, 2)



# 6. Editing Structure
select!(df, Not([:region, :product]))
names!(df, [:Region, :Product, :Year, :Production, :Consumption, :RegProd])
df = df[:, [:Year, :Product, :Region, :Production, :Consumption, :RegProd])
df.id = 1:size(df, 1)
insert!(df, 3, 2020, :Year)



# 7. Managing Missing Values
dropmissing!(df)
df = completecases(df)



# 8. Split-Apply-Combine
