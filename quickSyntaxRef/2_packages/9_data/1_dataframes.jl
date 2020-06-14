using CSV
using DataFrames


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

mat2 = ["c1", "c2", "c3"; 1 2 3; 4 5 6]
df4 = DataFrame([[mat2[2:end, i]...] for i in 1:size(mat2, 2)], 
								Symbol.(mat2[1, :]))



# 3. Getting Insights about the Data